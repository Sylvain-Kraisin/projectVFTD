class TestsController < ApplicationController
before_action :find_test, only: [:show, :edit, :update]
before_action :authenticate_user!, only: [:show]
before_filter :admin?, only: [:new, :create, :edit, :update]

  def index
  end

  def create
    @test = Test.new(test_params)
    @test.video_id = params[:video_id]
    @test.video_title = params[:video_title]

    if @test.save
      redirect_to pages_adminpage_path
    else
      render 'new'
    end
  end

  def new
    @test = Test.new
    @videos = Video.all.map{ |c| [c.title, c.id]}
    @videos2 = Video.all.map{ |v| [v.id, v.title]}
  end

  def edit
    @videos = Video.all.map{ |c| [c.title, c.id]}
    @videos2 = Video.all.map{ |v| [v.id, v.title]}
  end

  def show
  end

  def update
    @videos = Video.all.map{ |c| [c.title, c.id]}
    @videos2 = Video.all.map{ |v| [v.id, v.title]}
    if @test.update(test_params)
      redirect_to pages_adminpage_path
    else
      render 'edit'
    end
  end

  private
    def test_params
      params.require(:test).permit(:user_username, :video_id, :video_title, :question_1, :reponse_1, :answer_1, :question_2, :reponse_2, :answer_2, :question_3, :reponse_3, :answer_3, :question_4, :reponse_4, :answer_4, :note, :done)
    end

    def find_test
      @test = Test.find(params[:id])
    end


end
