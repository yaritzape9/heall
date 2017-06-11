class MessagesController < ApplicationController
  def index
    @message = Message.new
    @type_user = session[:type]
    @all_messages = get_messages
  end

  def create
    p "*" * 30
    new_message = Message.create(girl_id: params[:girl_id], volunteer_id: params[:volunteer_id], message:params[:message])

    respond_to do |format|
      format.html {redirect_to volunteer_girl_messages_path}
      format.js { }
    end
  end

  private

  def get_messages
    hashed_message = {}
    @girl = Girl.find(params[:girl_id])
    @volunteer = Volunteer.find(params[:volunteer_id])
    messages = Message.where(girl: @girl, volunteer: @volunteer)
    messages.each do |message|
      if @type_user == "volunteer"
        if message.volunteer_owner == true
          hashed_message[message.message] = @volunteer.username
        else
          EasyTranslate.api_key = ENV['TRANSLATION_API']
          languages = {
            'english' => 'en',
            'spanish' => 'spa',
            'portuguese' => 'pt',
            'arabic' => 'ar'
          }

          base_language = languages[@volunteer.language]
          detect = languages[@girl.language]
          body = message.message
          if(@volunteer.language != @girl.language)
            body_message = EasyTranslate.translate("#{body}", from: "#{detect}", to: "#{base_language}")
            hashed_message[body_message] = @girl.username
          else
            hashed_message[message.message] = @girl.username
          end
        end
      else
        if message.volunteer_owner == false
          hashed_message[message.message] = @girl.username
        else
          EasyTranslate.api_key = ENV['TRANSLATION_API']
          languages = {
            'english' => 'en',
            'spanish' => 'spa',
            'portuguese' => 'pt',
            'arabic' => 'ar'
          }
          base_language = languages[@girl.language]
          detect = languages[@volunteer.language]
          body = message.message
          if(@girl.language != @volunteer.language)
            body_message = EasyTranslate.translate("#{body}", from: "#{detect}", to: "#{base_language}")
            hashed_message[body_message] = @volunteer.username
          else
            hashed_message[message.message] = @volunteer.username
          end
      end
    end
    p hashed_message
    return hashed_message
  end
end
end
