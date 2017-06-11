module SessionsHelper

  def current_girl_user
    current_user ||= Girl.find(session[:girl_id]) if session[:girl_id]
  end

  def current_volunteer_user
    current_user ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end

  def current_user
    Girl.find(session[:girl_id]) if session[:girl_id] ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end
  # Logs in the given user.
  def log_in_girl(girl)
    session[:girl_id] = girl.id
  end

  def log_in_volunteer(volunteer)
    session[:volunteer_id] = volunteer.id
  end

  def logout
    session.clear
  end
end
