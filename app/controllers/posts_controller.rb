class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :admin?, only: [:destroy]
  before_action :author_can_edit_post?, only: [:edit, :update]
  before_action :create_visit, only: [:show]

  def index
    @categories = Category.all
    if params[:category].blank?
      @posts = Post.published.page(params[:page]).per(48).order("published_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.published.where(:category_id => @category_id).page(params[:page]).per(48).order("published_at DESC")
    end
  end

  def new
    redirect_to root_path unless current_user.reponses.count >= 2 || current_user.role == "admin"

    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.author = current_user.username

    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    redirect_to root_path unless @post.published? || post_author? || current_user && current_user.role == "admin"
    # @split = @post.content.split(" ")
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

  def post_author?
    user_signed_in? && current_user.reponses.count >= 2 && @post.user_id == current_user.id
  end

  def submit_accept_or_refuse
    @post = Post.find(params[:id])
    if @post.draft? || @post.pending?
      if params[:choice] == "submit"
        @post.submit!
        flash[:notice] = "Ton livre '#{@post.title}' à été soumis à Papako. Tu recevras un mail dès qu'il l'aura lu."
        redirect_to root_path
      elsif params[:choice] == "accept"
        @post.accept!
        flash[:notice] = "L'article '#{@post.title}' a été ajouté à la liste des articles en attente de publication"
        redirect_to admin_path
      elsif params[:choice] == "refuse"
        @post.refuse!
        flash[:notice] = "L'article '#{@post.title}' a été refusé"
        redirect_to admin_path
      end
    end
  end

  private

    def author_can_edit_post?
        redirect_to root_path unless @post.draft? && post_author? || (current_user.role == "admin")
    end

    def post_params
      params.require(:post).permit(:title, :content, :author, :category_id, :user_id, :image)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def create_visit
      @visits = Visit.by_user.where(post_id: @post)

      if user_signed_in?
        if current_user.role != "admin" && current_user.id != @post.user_id
          if !@visits.exists? || @visits.last.user_id != current_user.id
              Visit.create post_id: @post.id, user_id: current_user.id, user_username: current_user.username
          end
        end
      else
        Visit.create post_id: @post.id
      end
    end

end
