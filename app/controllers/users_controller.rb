class UsersController < ApplicationController

  before_action :authorized, except: [:new, :create, :home]
  before_action :user_finder, only: [:show, :edit, :update]
  
  def show
    @ordered_tasks = @user.assigned_tasks.order("due_date")
    @task = Task.new
    @user_teams = current_user.teams
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
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
  end

  def destroy
    User.destroy(params[:id])
    redirect_to home_path
  end

  def home
    
  end

  private

  def user_finder
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :age, :bio, :username, :password)
  end
end
