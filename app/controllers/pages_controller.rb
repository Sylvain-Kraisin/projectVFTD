class PagesController < ApplicationController
before_action :find_user, only: [:destroy]
before_filter :admin?, only: [:adminpage]
before_filter :nanda, only: [:correspondances]
layout :resolve_layout


  def index
    @user = current_user
    @video = Video.last
    @post = Post.last
    @comment = Comment.last
    @goodreponses = Reponse.where("total is NOT NULL")

    if signed_in?
    @userreponse = Reponse.where(["total is NOT NULL"]).where(user_username: @user.username)
    end
  end

  def videos
  end

  def casier
  end

  def forum
  end

  def faq
  end

  def cooperative
  end

  def adminpage
    @users = User.all.order("created_at DESC").limit(50)
    @posts = Post.all.order("created_at DESC")
    @visits = Visit.all.order("created_at DESC").limit(50)
    @videos = Video.all.order("created_at DESC")
    @comments = Comment.all.order("created_at DESC")
    @consoles = Console.all.order("created_at DESC")
    @tests = Test.all.order("created_at DESC")
    @reponsesacorriger = Reponse.where(total: nil)
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


  def resolve_layout
    case action_name
    when "videos"
      "videos"
    when "forum"
      "forum"
    when "casier"
      "casier"
    when "faq"
      "faq"
    when "cooperative"
      "cooperative"
    else
      "application"
    end
  end

end
