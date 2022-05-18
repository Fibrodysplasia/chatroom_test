class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "You are logged in."
            redirect_to root_path
        else
            flash.now[:alert] = "Something was wrong with your login details."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
        flash[:notice] = 'Successfully logged out.'
    end

end