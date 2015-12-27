class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    @comment.user_username = current_user.username

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end


end
