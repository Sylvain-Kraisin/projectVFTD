class TestsController < ApplicationController
before_action :find_test
  def show
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to root_path
    else
      render 'show'
    end
  end

  private
    def test_params
      params.require(:test).permit(:video_id, :video_title, :question_1, :reponse_1, :answer_1, :question_2, :reponse_2, :answer_2, :question_3, :reponse_3, :answer_3, :question_4, :reponse_4, :answer_4, :note, :done)
    end

    def find_test
      @test = Test.find(params[:id])
    end


end
