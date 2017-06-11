class GirlsController < ApplicationController

  def profile
    @girl = Girl.find(current_girl_user.id)
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
       params.require(:girl).permit(:name, :age, :language, :keyword, :password)
    end

end
