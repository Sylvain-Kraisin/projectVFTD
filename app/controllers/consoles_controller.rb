class ConsolesController < ApplicationController

  def index
  end

  def show
    @console = Console.find(params[:id])
    @videos = Video.all
    @videok = @videos.where(console_id: @console.id).page(params[:page]).per(1).order("created_at ASC")
  end

end
