class VideosController < ApplicationController
before_filter :admin?, only: [:new, :edit]
before_action :find_video, only: [:show, :edit, :update, :destroy]

  def show
    @user = current_user
    @test = Test.where(video_id: @video.id).first
    @reponse = Reponse.where(test_id: @test.id, user_username: @user.username).first

  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to pages_adminpage_path
    else
      render 'new'
    end
  end

  def new
    @video = Video.new
  end


  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to pages_adminpage_path
    else
      render 'edit'
    end
  end

  private

    def find_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :console_id, :video_img, :link, :style, :release, :genre, :player, :developer)
    end
end
