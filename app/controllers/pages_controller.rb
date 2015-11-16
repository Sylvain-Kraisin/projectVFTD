class PagesController < ApplicationController
before_action :find_user, only: [:destroy]
before_filter :admin?, only: [:adminpage]

  def index
    @post = Post.all
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
    @user = User.all
    @post = Post.all
  end


end
