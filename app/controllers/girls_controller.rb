class GirlsController < ApplicationController

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)
      if @girl.save
        log_in_girl @girl
        redirect_to "/girls/#{@girl.id}"
      else
        flash[:danger] = "Error creating a new instance of yourself!"
        render 'new'
      end
    end

    def show
      @girl = Girl.find(current_girl_user.id)
    end

    private

    def girl_params
       params.require(:girl).permit(:username, :age, :language, :keyword, :password)
    end

end
