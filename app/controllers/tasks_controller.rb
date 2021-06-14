class TasksController < ApplicationController

  before_action :set_task, only: [ :show, :edit, :update, :destroy ]


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

   # GET /tasks/1
  def show; end

   # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render json: { msg: 'success', task: @task } }
      end
    else
      puts @task.errors.full_messages
      render :new
    end
  end

   # GET /tasks/1/edit
  def edit; end

   # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Task was successfully updated.' }
        format.json { render json: { msg: 'success', task: @task } }
      end
    else
      render :index
    end

    # redirect_to task_path(@task)
  end

   # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
    # redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
