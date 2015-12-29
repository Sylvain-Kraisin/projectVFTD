class ReponsesController < ApplicationController
before_action :find_test
before_action :find_reponse, only: [:edit, :update, :show]
before_filter :admin?, only: [:edit, :update, :destroy]
before_action :reponse_show_user_or_admin_only, only: [:show]
before_action :authenticate_user!, only: [:new, :create, :show]
before_action :total, only: [:show]



    def show

    end

    def new
      @reponse = Reponse.new
    end

    def create
      @reponse = Reponse.new(reponse_params)
      @reponse.test_id = @test.id
      @reponse.user_username = current_user.username
      @reponse.email = current_user.email

      if @reponse.save
        redirect_to test_path(@test) #show
      else
        render 'new'
      end
    end

    def edit
      @video = Video.where(id: @reponse.test_id).first
    end

    def update
      if @reponse.update(reponse_params)
        redirect_to test_reponse_path(@test, @reponse)
      else
        render 'edit'
      end
    end

    def destroy
      @reponse.destroy
      redirect_to pages_adminpage_path
    end



  private

    def reponse_params
      params.require(:reponse).permit(:test_id, :user_username, :reponse_1, :reponse_2, :reponse_3, :reponse_4, :note_1, :note_2, :note_3, :note_4, :total, :email)
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_reponse
      @reponse = Reponse.find(params[:id])
    end

    def reponse_show_user_or_admin_only
      if signed_in?
        redirect_to root_path unless current_user.username == @reponse.user_username || current_user.role == "admin"
      else
        redirect_to root_path
      end
    end

    def total
      if @reponse.total == nil
      @reponse.update total: @reponse.note_1 + @reponse.note_2 + @reponse.note_3 + @reponse.note_4
      end
    end





end
