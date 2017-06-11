class SessionsController < ApplicationController

  def new
  end

  def create

    girl = Girl.find_by(username: params[:session][:name])
    volunteer = Volunteer.find_by(username: params[:session][:name])

    if volunteer
      if volunteer.authenticate(params[:session][:password])
        volunteer?("volunteer")
        log_in_volunteer volunteer
        redirect_to "/volunteers/#{current_volunteer_user.id}"
      else
        flash[:danger] = 'Invalid username/password combination'
        render 'new'
      end
    elsif girl
      if girl.authenticate(params[:session][:password])
        volunteer?("girl")
        log_in_girl girl
        redirect_to "/girls/#{current_girl_user.id}"
      else
        flash[:danger] = 'Invalid username/password combination'
        render 'new'
      end
    end

  end

  def destroy
    logout
    redirect_to "/"
  end
end
