class ConsolesController < ApplicationController
  before_filter :admin?, only: [:new, :edit, :draft]
  before_action :find_console, only: [:edit, :update, :destroy]

  def index
  end

  def create
    @console = Console.new(console_params)

    if @console.save
      redirect_to pages_adminpage_path
    else
      render 'new'
    end
  end

  def new
    @console = Console.new
  end


  def edit
  end

  def update
    if @console.update(console_params)
      redirect_to pages_adminpage_path
    else
      render 'edit'
    end
  end


  def show
    @console = Console.find(params[:id])
    @videos = @console.videos.online
  end

  def draft
    @console = Console.find(params[:id])
    @videos = @console.videos.draft
  end

  private

    def find_console
      @console = Console.find(params[:id])
    end

    def console_params
      params.require(:console).permit(:title, :unlock, :console_img)
    end
end
