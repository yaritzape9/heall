class VolunteersController < ApplicationController

  def new
    @document = Volunteer.find(1)
    @volunteer = Volunteer.new
  end

  def create
    redirect '/'
  end

end
