class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_filter :admin?, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def new
    @post = Post.new

  end

  def edit
  end

  def show
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
      params.require(:post).permit(:title, :content, :author)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
