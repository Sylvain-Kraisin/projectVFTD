class ReponsesController < ApplicationController
before_action :find_test
before_action :find_reponse, only: [:edit, :update]
before_filter :admin?, only: [:edit, :update, :show]
before_action :authenticate_user!, only: [:new, :create]

    def new
      @reponse = Reponse.new
    end

    def create
      @reponse = Reponse.new(reponse_params)
      @reponse.test_id = @test.id
      @reponse.user_username = current_user.username

      if @reponse.save
        redirect_to test_path(@test)
      else
        render 'new'
      end
    end

    def edit
    end

    def update

      if @reponse.update(reponse_params)
        redirect_to root_path
      else
        render 'edit'
      end
    end

    def show
    end

  private

    def reponse_params
      params.require(:reponse).permit(:test_id, :user_username, :reponse_1, :reponse_2, :reponse_3, :reponse_4)
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_reponse
      @reponse = Reponse.find(params[:id])
    end

end