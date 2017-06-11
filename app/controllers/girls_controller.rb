class GirlsController < ApplicationController

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)
      if @girl.save
        volunteer?("girl")
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

    def new_heally
      match = find_volunteer(params[:expertise])
      @girl = Girl.find(current_girl_user.id)
      GirlVolunteer.create(girl_id: @girl.id, volunteer_id: match.volunteer_id)
      redirect_to "/volunteers/#{match.volunteer_id}/girls/#{@girl.id}/messages"
    end

    private

    def girl_params
       params.require(:girl).permit(:username, :age, :language, :keyword, :password)
    end

    def find_volunteer(expertise)
      VolunteerExpertise.where(expertise: Expertise.find_by(name: expertise)).first
    end

end
