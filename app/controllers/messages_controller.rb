class MessagesController < ApplicationController
    
  before_action :require_user

  def create
    message = current_user.message.build(message_params)
    if message.save
      message = Message.create(message_params)
    else
      render root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end