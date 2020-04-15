class SessionsController < ActionController::Base

    def login

    end

    def process_login
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash["error"] = "Username/Password Not Found"
            render :login
        end
    end

    def logout
        session.clear
        redirect_to home_path
    end
end