class PagesController < ApplicationController
before_action :find_user, only: [:destroy]
before_filter :admin?, only: [:adminpage]

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
    @user = User.all.order("created_at DESC")
    @post = Post.all.order("created_at DESC")
    @visit = Visit.all.order("created_at DESC").limit(100)
  end


end
