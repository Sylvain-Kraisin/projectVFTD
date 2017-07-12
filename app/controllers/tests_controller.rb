class TestsController < ApplicationController
before_action :find_test, only: [:show, :edit, :update]
before_action :authenticate_user!, only: [:show]
before_action :admin?, only: [:new, :create, :edit, :update]


  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.video_title = Video.find(@test.video_id).title

    if @test.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @test.update(test_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  private
    def test_params
      params.require(:test).permit(:video_id, :video_title, :question_1, :answer_1, :question_2, :answer_2, :question_3, :answer_3, :question_4, :answer_4, :console_id)
    end

    def find_test
      @test = Test.find(params[:id])
    end




end
