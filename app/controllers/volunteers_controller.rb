class VolunteersController < ApplicationController

  def profile
    @volunteer = Volunteer.find(current_volunteer_user.id)
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
      if @volunteer.save
        log_in @volunteer
        redirect_to "/volunteers/#{@volunteer.id}/profile"
      else
        flash[:danger] = "Error creating a new instance of yourself!"
        render 'new'
      end
    end

    private

    def volunteer_params
       params.require(:volunteer).permit(:username, :langauge, :certification, :password)
    end

end
