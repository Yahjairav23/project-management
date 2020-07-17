class ProjectsController < ApplicationController
  before_action :authorized
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.where(:team_id => current_user.teams)

    @completed_projects = []
    @projects.each do |p|
      if p.status == "Complete"
        @completed_projects << p 
      end 
    end 

    @incomplete_projects = []
    @projects.each do |p|
      if p.status != "Complete"
        @incomplete_projects << p 
      end 
    end 
    @incomplete_projects = @incomplete_projects.sort_by {|p| p[:start_date]}
   

  end

  def show
     #separates out completed tasks 
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
    @incomplete_tasks = @incomplete_tasks.sort_by {|t| t[:due_date]}
    @task = Task.new 

  end

  def new
    @project = Project.new 
    @teams = current_user.teams
    
    3.times {@project.tasks.build}
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


  def complete
    @project = Project.find(params[:id])
    @project.update_attribute(:status, "Complete")
    @project.update_attribute(:completed_at, Time.now)
    redirect_to root_path 
  end 

  private 

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params 
    params.require(:project).permit(:name, 
      :start_date, 
      :end_date, 
      :description, 
      :team_id, 
      :status, 
        tasks_attributes: [
          :creator_id, 
          :assignee_id, 
          :priority, 
          :description, 
          :due_date, 
          :status, 
          :created_location])
  end 


end
