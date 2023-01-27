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

    def redirect_if_not_authorized
        if @subscription.user != current_user
            flash[:error] = "You can't make this edit, you are not the owner of this account"
            redirect_to subscription_path
        end    
    end

end
