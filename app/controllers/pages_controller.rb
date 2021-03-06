class PagesController < ApplicationController
before_action :update_presence, only: [:index]
before_action :admin?, only: [:adminpage]
before_action :authenticate_user!, only: [:casier]
before_action :nanda, only: [:correspondances]
layout :resolve_layout


  def index
    @user = current_user
    @video = Video.online.last
    @console = @video.console
    @post = Post.published.order('published_at DESC').first
    @comment = Comment.last
    @goodreponses = Reponse.where("total is NOT NULL").where.not(user_id:1 )

    @topten = User.order('score desc').where(role:nil).first(10)
    #@topten2 = @topten.order('score asc')

    if signed_in?
      @userreponse = current_user.reponses.where(["total is NOT NULL"])
    end
  end

  def videos
  end

  def casier
    @user = current_user
    @userreponse = @user.reponses.where(["total is NOT NULL"])
    @goodreponses = Reponse.where("total is NOT NULL").where.not(user_id:1 )
    @goodusers = User.where(["average is NOT NULL"]).where(role:nil)
    @goodusers_two = User.where(role:nil)
    @rank = @goodusers_two.order('sign_in_count desc').index(@user)
    @ranknote = @goodusers.order('score desc').index(@user)
    @camarades = User.where(classroom:@user.classroom).where.not(username:@user.username)
  end

  def faq
  end

  def cooperative
  end

  def cartable_numerique
  end

  def adminpage

    @users = User.all.order("created_at DESC")
    @posts = Post.all.order("created_at DESC")
    @visits = Visit.by_user.order("created_at DESC").limit(50)
    @videos = Video.all.order("created_at DESC")
    @comments = Comment.all.order("created_at DESC").limit(50)
    @consoles = Console.all.order("created_at DESC")
    @tests = Test.all.order("created_at DESC")
    @reponsesacorriger = Reponse.where(total: nil)
    #@testsrandom = Test.all.order("RANDOM()").limit(3)
  end

  def correspondances
    # raise "error"
  end

  def halloffame
    @tophundred = User.where(["average is NOT NULL"]).where(role:nil).order('score desc').first(100)
  end

  private

  def update_presence
    if signed_in?
      @user = current_user

      if @user.presence == nil
        @user.update presence: 1

      elsif @user.role != "admin" && @user.updated_at != Time.now
        @user.update presence: @user.presence + 1
      end

    end
  end

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
    when "adminpage"
      "adminpage"
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
