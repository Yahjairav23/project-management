class TasksController < ApplicationController
  before_action :authorized
  before_action :set_task, only: [:show, :edit, :update, :completed, :destroy]

  def index
    @ordered_tasks = Task.where(:assignee_id => current_user).order("due_date")
    @completed_tasks = @ordered_tasks.select{|task| task.date != nil}
    @incomplete_tasks = @ordered_tasks.select{|task| task.date == nil}
    @task = Task.new
  end

  def show
    @comment = Comment.new 
    @task_comments = Comment.all.where(task_id: @task.id).order("created_at DESC")
  end

  def new
    @task= current_user.created_tasks.build 
  end

  def create
    @task= current_user.created_tasks.build(task_params)
    if @task.valid?
      @task.save
      
      if @task.created_location == "project" 
          redirect_to project_path(@task.project_id)
      elsif 
          @task.created_location.nil?
          redirect_to task_path(@task.id)
      # #if created from USER page, reload USER page after task creation
        else
          redirect_to tasks_path
        end 
    else
      render :new
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

  def completed
    @task.update(date: Date.today, status: "Complete")
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:project_id, :creator_id, :assignee_id, :priority, :description, :due_date, :status, :created_location)
  end 



end
