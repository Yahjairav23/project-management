class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task= Task.new 
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task.id)
  end

  def edit
  end 

  def update
    if @task.update(task_params)
      @task.save
      redirect_to task_path(@task.id)
    else 
      render :edit 
    end 
  end 

  def destroy
    @task.destroy
    redirect_to project_path(@task.project.id)
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:project_id, :creator_id, :assignee_id, :priority, :description, :due_date, :status)
  end 



end
