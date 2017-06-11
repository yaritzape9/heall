class SessionsController < ApplicationController
  
  def new
  end

  def create

    girl = Girl.find_by(username: params[:session][:username])
    volunteer = Volunteer.find_by(username: params[:session][:username])

    if volunteer && volunteer.authenticate(params[:session][:password])
      log_in_volunteer volunteer
      redirect_to "/volunteers/#{current_volunteer_user.id}/profile"
    else
      flash[:danger] = 'Invalid username/password combination'
      render 'new'
    end

    if girl && girl.authenticate(params[:session][:password])
      log_in_girl girl
      redirect_to "/girls/#{current_girl_user.id}/profile"
    else
      flash[:danger] = 'Invalid username/password combination'
      render 'new'
    end

  end

  def destroy
    logout
    redirect_to "/"
  end
end
