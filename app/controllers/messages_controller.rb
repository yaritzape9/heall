class MessagesController < ApplicationController

  def index
    @girl = Girl.find(params[:girl_id])
    @volunteer = Volunteer.find(params[:volunteer_id])
    @message = Message.new
    @type_user = session[:type]
    @all_messages = get_messages
  end

  def create
    @type_user = session[:type]
    if @type_user == "volunteer"
      volunteer_owner = true
    else
      volunteer_owner = false
    end
    new_message = Message.create(girl_id: params[:girl_id], volunteer_id: params[:volunteer_id], message:params[:message], volunteer_owner:volunteer_owner)
    #
    # respond_to do |format|
    #   format.html {redirect_to volunteer_girl_messages_path}
    #   format.js { }
    # end
    redirect_to volunteer_girl_messages_path
  end

  def main_talk
    render fake_talk
  end

  def redirect_to_talk
    if current_girl_user.keyword == params[:message]
      redirect_to "/volunteers/#{current_volunteer_user}/girls/#{current_girl_user}/messages"
    else
      redirect_to conversation_path
    end
    #if you write the special password, you can go; otherwise, you are redirected to the weird normal talk
  end

  private

  def get_messages
    hashed_message = {}
    i = 0
    @girl = Girl.find(params[:girl_id])
    @volunteer = Volunteer.find(params[:volunteer_id])
    messages = Message.where(girl: @girl, volunteer: @volunteer)
    messages.each do |message|
      if @type_user == "volunteer"
        if message.volunteer_owner == true
          hashed_message[message.message] = @volunteer.username
        else
          EasyTranslate.api_key = "AIzaSyC1nqeNF7szd4mPbBabhAW9TkdtnUrctac"
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
            p hashed_message
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
          EasyTranslate.api_key = "AIzaSyC1nqeNF7szd4mPbBabhAW9TkdtnUrctac"
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
    end
    return hashed_message
  end
end
