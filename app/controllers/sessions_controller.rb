class SessionsController < ApplicationController

    # Only going render login form - not creating any new obj
    def new
        if logged_in?
            redirect_to root_path
        end
    end

    # process login form
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path
        else
          render :new  
        end
    end

    # logout
    def destroy
        session.delete :user_id
        redirect_to login_path
    end



end