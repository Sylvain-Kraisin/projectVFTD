class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :create_visit, only: [:show]
  before_filter :bibliothequaire?, only: [:new, :create, :edit, :update]
  before_filter :admin?, only: :destroy

  def index
    @categories = Category.all
    if params[:category].blank?
      @posts = Post.page(params[:page]).per(24).order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(:category_id => @category_id).page(params[:page]).per(24).order("created_at DESC")
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @split = @post.content.split(" ")

  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :author, :category_id, :post_img)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def create_visit
      @visit = Visit.where(post_id: @post)

      if user_signed_in?
        if current_user.role != "admin" && current_user.username != @post.author
          if !@visit.exists? || @visit.last.user_username != current_user.username
              Visit.create post_id: @post.id, user_username: current_user.username

          end
        end
      end
    end
end
