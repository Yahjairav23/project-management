class TeamsController < ApplicationController
  before_action :authorized
  before_action :find_team, only: [:show, :edit, :update]

  def index
    @teams = current_user.teams
  end

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
    redirect_to home_path
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
