class ChatroomController < ApplicationController

  def index
    if logged_in?
      @messages = Message.all
    else
      redirect_to '/login'
      flash[:notice] = "You must be logged in to chat."
    end
  end

end
