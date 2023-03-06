class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.custom_display
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to @chatroom
    else
      render 'new'
    end
  end


  private

  def chatroom_params
    params.require(:chatroom).permit(:id,:name)
  end



end
