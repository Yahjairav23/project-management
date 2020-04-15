class TasksController < ApplicationController
  before_action :authorized
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
    @comment = Comment.new 
    @task_comments = Comment.all.where(task_id: @task.id)
  end

  def new
    @task= Task.new 
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      redirect_to task_path(@task.id)
    else
      rend :new
    end 
  end




  def edit
  end 

  def update
    @task.update(task_params)
    if @task.valid?
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
