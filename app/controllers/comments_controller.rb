class CommentsController < ApplicationController
  before_action :find_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to posts_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end


end
