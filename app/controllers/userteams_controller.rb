class UserteamsController < ApplicationController

    def new
        @userteam = Userteam.new
    end

    def create
        @userteam = Userteam.new(userteam_params)
        if @user.valid?
          @userteam.save
          redirect_to user_path(@user)
        else
          render :new
        end
    end
    
    def destroy
        Userteam.destroy(params[:id])
    end
    
  
    

    private

    def userteam_params
        params.require(:userteam).permit(:user_id, :team_id)
      end
end