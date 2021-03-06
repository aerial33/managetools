class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only:[:show, :edit, :update, :destroy, :change]

  def index
    @to_do = current_user.tasks.where(state: "to_do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
    @tasks = policy_scope(Task)
  end

  def show
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = current_user.tasks.build(task_params)
    authorize @task
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        # format.html { redirect_to @task, notice: 'Task was successfully updated.'} or
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  def change
    @task.update_attributes(state:params[:state])
    respond_to do |format|
      format.html {redirect_to tasks_url}
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:title, :content, :completed, :state)
  end
end
