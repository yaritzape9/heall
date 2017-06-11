class MessagesController < ApplicationController
  def index
    @message = Message.new
    @current_user = params[:session]#[:girl_id] ||= params[:session][:volunteer_id] ||= nil
    @girl = Girl.find(params[:girl_id])
    @volunteer = Volunteer.find(params[:volunteer_id])
    @all_messages = Message.where(girl:@girl, volunteer:@volunteer)
  end

  def create
    p "*" * 30
    new_message = Message.create(girl_id: params[:girl_id], volunteer_id: params[:volunteer_id], message:params[:message])

    respond_to do |format|
      format.html {redirect_to volunteer_girl_messages_path}
      format.js { }
    end
  end


end
