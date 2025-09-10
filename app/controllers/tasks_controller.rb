class TasksController < ApplicationController
  before_action :authenticate_user!

  # def index
  # end

  # def show
  # end

  # def new
  # end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.category_id = params[:category_id]

    if @task.save
      redirect_to dashboard_path
    else
    p @task.errors.messages
    p "@task.user_id: #{@task.user_id}"
    p "@task.category_id #{@task.category_id}"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:task_title, :task_body)
  end
end
