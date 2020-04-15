class ApplicationController < ActionController::Base

    helper_method :current_user
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        if !logged_in?
            flash["error"] = "You must be logged in."
            redirect_to login_path
        end
    end
end
