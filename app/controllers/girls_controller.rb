class GirlsController < ApplicationController

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)
      if @girl.save
        log_in_girl @girl
        redirect_to "/girls/#{@girl.id}"
      else
        flash[:danger] = "Error creating a new instance of yourself!"
        render 'new'
      end
    end

    def show
      EasyTranslate.api_key = ENV['TRANSLATION_API']
      languages = {
        'english' => 'en',
        'spanish' => 'spa',
        'portuguese' => 'pt',
        'arabic' => 'ar'
      }
      @girl = Girl.find(current_girl_user.id)

      base_language = languages[@girl.language]
      detect = languages[current_volunteer_user.language]
      # detect = EasyTranslate.detect "Hola Como Estas"
      # sent_langauge = EasyTranslate::LANGUAGES[detect]

      if(@girl.language.downcase != current_volunteer_user.language)
        EasyTranslate.translate("Hola", from: "#{detect}", to: "#{base_language}")
      end
    end

    private

    def girl_params
       params.require(:girl).permit(:username, :age, :language, :keyword, :password)
    end

end
