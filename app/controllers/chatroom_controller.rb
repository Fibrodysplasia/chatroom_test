class ChatroomController < ApplicationController
  #I replaced the code below with this
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.all
    # if logged_in?
    #   @messages = Message.all
    # else
    #   redirect_to '/login'
    #   flash[:notice] = "You must be logged in to chat."
    # end
  end

end
