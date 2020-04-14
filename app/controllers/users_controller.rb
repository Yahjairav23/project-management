class UsersController < ApplicationController

  before_action :user_finder, only: [:show, :edit, :update]
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    #where should we place the link for this?
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
    #create validation errors
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      @user.save 
      redirect_to user_path(@user)
    else
      render :edit
    end
    #create validaion errors
  end

  def destroy
    User.destroy(params[:id])
  end

  private

  def user_finder
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :age, :bio, :team_id)
  end
end
