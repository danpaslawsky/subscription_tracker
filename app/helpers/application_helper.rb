module ApplicationHelper

    # memoization
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) 
    end

    def logged_in?
        current_user
    end

    def require_login
        unless current_user
          flash[:notice] = "Please login"
          redirect_to root_url
        end
    end

end
