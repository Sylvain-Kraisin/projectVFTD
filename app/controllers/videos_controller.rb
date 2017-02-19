class VideosController < ApplicationController
before_action :admin?, only: [:new, :edit, :update, :publish]
before_action :find_video, only: [:show, :edit, :update]

  def show
    @user = current_user
    @test = @video.test

    if @video.draft?
      redirect_to root_path unless user_signed_in? && @user.role == 'admin'
    end

    if user_signed_in?
      if Reponse.exists?(test_id: @test.id, user_id: @user.id)
        @reponse = Reponse.find_by(test_id: @test.id, user_id: @user.id)
      end
    end
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

  def publish
    @video = Video.find(params[:id])

    @video.run! unless @video.online?
    flash[:notice] = "La vidéo #{@video.title} est maintenant en ligne"
    redirect_to pages_adminpage_path
  end

  private

    def find_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :console_id, :video_img, :link, :style, :release, :genre, :player, :developer)
    end
end
