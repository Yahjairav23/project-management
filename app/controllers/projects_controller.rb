class ProjectsController < ApplicationController
  def index
    @projects = Project.all 
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new 
  end

  def edit
  end
end
