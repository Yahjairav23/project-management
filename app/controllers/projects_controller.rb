class ProjectsController < ApplicationController
  before_action :authorized
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all 
  end

  def show
     #move to model?
     #separates out completd tasks 
    @completed_tasks = []
    @project.tasks.each do |t|
      if t.status == "Complete"
        @completed_tasks << t 
      end 
    end 

    #separates out incomplete tasks 
    @incomplete_tasks = []
    @project.tasks.each do |t|
      if t.status != "Complete"
        @incomplete_tasks << t 
      end 
    end 

    @task = Task.new 

  end

  def new
    @project = Project.new 
  end

  def create
    @project = Project.new(project_params)
    if @project.valid?
      @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project.valid?
      @project.save
      redirect_to project_path(@project)
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
