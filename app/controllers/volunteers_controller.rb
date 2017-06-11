class VolunteersController < ApplicationController

  def index
  end

  def show
    EasyTranslate.api_key = ENV['TRANSLATION_API']
    languages = {
      'english' => 'en',
      'spanish' => 'spa',
      'portuguese' => 'pt',
      'arabic' => 'ar'
    }
    @volunteer = Volunteer.find(current_volunteer_user.id)

    base_language = languages[@volunteer.language]
    detect = languages[current_girl_user.language]
    # detect = EasyTranslate.detect "Hola Como Estas"

    if(@volunteer.language != current_girl_user.language)
      EasyTranslate.translate("this is english", from: "#{detect}", to: "#{base_language}")
    end

  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
      if @volunteer.save
        log_in_volunteer @volunteer
        redirect_to "/volunteers/#{@volunteer.id}"
      else
        flash[:danger] = "Error creating a new instance of yourself!"
        render 'new'
      end
    end

    private

    def volunteer_params
       params.require(:volunteer).permit(:username, :language, :password)
    end


end
