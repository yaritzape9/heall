class VolunteersController < ApplicationController

  def index
  end

  def show
    @volunteer = Volunteer.find(current_volunteer_user.id)
    # EasyTranslate.api_key = ENV['TRANSLATION_API']
    # languages = {
    #   'english' => 'en',
    #   'spanish' => 'spa',
    #   'portuguese' => 'pt',
    #   'arabic' => 'ar'
    # }
    #
    # base_language = languages[@volunteer.language]
    # detect = languages[current_girl_user.language]
    # # detect = EasyTranslate.detect "Hola Como Estas"
    # body = Message.where(girl: current_girl_user, volunteer: @volunteer)
    # p body
    # if(@volunteer.language != current_girl_user.language)
    #   p EasyTranslate.translate("#{body}", from: "#{detect}", to: "#{base_language}")
    # end

  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
      if @volunteer.save
        volunteer?("volunteer")
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
