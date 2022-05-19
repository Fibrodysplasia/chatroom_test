class MessagesController < ApplicationController
    
  before_action :require_user

  def create
    message = current_user.message.build(message_params)
    if message.save
      ActionCable.server.broadcast 'chatroom_channel', message: render_message(message), username: message.user.username
    else
      render root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end