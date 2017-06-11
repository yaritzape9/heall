class VolunteersController < ApplicationController

  def index
  end

  def show
    @volunteer = Volunteer.find(current_volunteer_user.id)
    # EasyTranslate.translate('Hola, mundo', :from => :spanish, :to => :en) # => "Hello, world"
    detect = EasyTranslate.detect "Hola Como Estas"
    sent_langauge = EasyTranslate::LANGUAGES[detect]

    # if(sent_langauge == @volunteer.language.downcase)
    #   p "They are the same"
    # else
    #   # EasyTranslate.translate("#{bodytext}"), from: "#{sent_langauge}", to: "#{@volunteer.language.downcase}"
    #   p "they are not the same"
    # end
  end

  def new
    @volunteer = Volunteer.new
    @expertise_array = ["Safe Sex", "STDs", "Pregnant", "Puberty", "Rape Prevention", "Mental Health"]
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
      if @volunteer.save
        VolunteerExpertise.create(volunteer: @volunteer, expertise: Expertise.find_or_create_by(name: params[:expertise_1]))
        VolunteerExpertise.create(volunteer: @volunteer, expertise: Expertise.find_or_create_by(name: params[:expertise_2]))
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
