class TasksController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_completion]

  def index
    @tasks = Task.includes(:user).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully deleted.'
  end

  def toggle_completion
    @task.update(completed: !@task.completed)
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@task, partial: 'tasks/task', locals: { task: @task }) }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :completed, :user_id)
  end
end 