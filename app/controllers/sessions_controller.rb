class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in."
            redirect_to root_path
        else
            flash.now[:alert] = "Something was wrong with your login details."
            redirect_to root_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Successfully logged out.'
        redirect_to root_path
    end

end