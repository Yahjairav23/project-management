class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all 
  end

  def show
     #move to model 
    @completed_tasks = []
    @project.tasks.each do |t|
      if t.status == "Complete"
        @completed_tasks << t 
      end 
    end 
    @incomplete_tasks = []
    @project.tasks.each do |t|
      if t.status != "Complete"
        @incomplete_tasks << t 
      end 
    end 

  end

  def new
    @project = Project.new 
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to project_path(@project.id)
  end

  def edit
  end

  def update
    if @project.update(project_params)
      @project.save
      redirect_to project_path(@project.id)
    else 
      render :edit 
    end 
  end 

  def destroy
    
    @project.destroy
    redirect_to projects_path 
  end


  private 

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params 
    params.require(:project).permit(:name, :start_date, :end_date, :description, :team_id, :status)
  end 


end
