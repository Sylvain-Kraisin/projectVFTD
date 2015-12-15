class ConsolesController < ApplicationController

  def index
  end

  def show
    @console = Console.find(params[:id])
  end

end
