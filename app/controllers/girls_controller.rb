class GirlsController < ApplicationController

  def profile
    @girl = Girl.find(current_user.id)
    @posts = @user.posts.order("created_at DESC")
  end

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)
      if @girl.save
        log_in @girl
        redirect_to "/girls/#{@girl.id}/profile"
      else
        flash[:danger] = "Error creating a new instance of yourself!"
        render 'new'
      end
    end

    private

    def girl_params
       params.require(:user).permit(:name, :email, :password)
    end

end
