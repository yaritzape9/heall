module SessionsHelper

  def current_girl_user
    current_user ||= Girl.find(session[:girl_id]) if session[:girl_id]
  end

  def current_volunteer_user
    current_user ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end

  def volunteer?(person)
    if person == "girl"
      session[:type] = "girl"
    else
      session[:type] = "volunteer"
    end
  end

  # Logs in the given user.
  def log_in_girl(girl)
    session[:girl_id] = girl.id
  end

  def log_in_volunteer(volunteer)
    session[:volunteer_id] = volunteer.id
  end

  def logged_in?
    if current_girl_user == nil || current_volunteer_user == nil
      return false
    end
    return true
  end

  def logout
    session.clear
  end
end
