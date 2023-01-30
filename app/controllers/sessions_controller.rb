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
          flash.now[:notice] =  "* Login Info Was Incorrect - Please Try Again *"
          render :new          
        end
    end

    # logout
    def destroy
        session.delete :user_id
        redirect_to login_path
    end

    def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
            u.username = request.env['omniauth.auth'][:info][:name]
            u.email = request.env['omniauth.auth'][:info][:email]
            u.password = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

end