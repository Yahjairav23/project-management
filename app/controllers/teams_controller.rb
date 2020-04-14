class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def index
  end

  def new
  end

  def edit
  end
end
