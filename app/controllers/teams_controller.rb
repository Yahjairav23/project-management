class TeamsController < ApplicationController

  before_action :user_finder, only: [:show, :edit, :update]

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    redirect_to team_path(@team)
  end

  def edit
  end

  def update
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  def destroy
    Team.destroy(params[:id])
    
    #where should we redirect to?

  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
