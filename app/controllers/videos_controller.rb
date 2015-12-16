class VideosController < ApplicationController
before_filter :admin?, only: [:new, :edit]

  def show
    @video = Video.find(params[:id])

  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to pages_videos_path
    else
      render 'new'
    end
  end

  def new
    @video = Video.new
  end


  def edit
  end

  private

    def video_params
      params.require(:video).permit(:title, :console_id, :video_img)
    end
end
