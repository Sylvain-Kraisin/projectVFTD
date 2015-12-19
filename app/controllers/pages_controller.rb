class PagesController < ApplicationController
before_action :find_user, only: [:destroy]
before_filter :admin?, only: [:adminpage]
before_filter :nanda, only: [:correspondances]

  def index
  end

  def videos
  end

  def blog
  end

  def dst
  end

  def forum
  end

  def adminpage
    @users = User.all.order("created_at DESC")
    @posts = Post.all.order("created_at DESC")
    @visits = Visit.all.order("created_at DESC").limit(100)
    @videos = Video.all.order("created_at DESC")
    @comments = Comment.all.order("created_at DESC")
    @consoles = Console.all.order("created_at DESC")
  end

  def correspondances
  end

  private

  def nanda
    if signed_in?
      redirect_to root_path unless current_user.role == "admin" || current_user.role == "nanda"
    else
      redirect_to root_path
    end
  end

end
