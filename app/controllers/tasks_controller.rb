class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy, :up, :down]

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.project && @task.project.user_id == current_user.id && @task.save
        format.js
      else
        format.js { render js: "alert(\"#{@task.errors.full_messages.join(', ')}\");" }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.project && @task.project.user_id == current_user.id && @task.update(task_params)
        format.js
      else
        format.js { "alert(\"#{@task.errors.full_messages.join(', ')}\");" }
      end
    end
  end

  def up
    @up_task = Task.where(project_id: @task.project_id, priority: (@task.priority + 1)).first
    if @up_task
      @up_task.update_column(:priority, (@up_task.priority - 1))
      @task.update_column(:priority, (@task.priority + 1))
    end
    @project = @task.project

    respond_to do |format|
      format.js
    end
  end

  def down
    @down_task = Task.where(project_id: @task.project_id, priority: (@task.priority - 1)).first
    if @down_task
      @down_task.update_column(:priority, (@down_task.priority + 1))
      @task.update_column(:priority, (@task.priority - 1))
    end
    @project = @task.project

    respond_to do |format|
      format.js
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy if @task.project && @task.project.user_id == current_user.id
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:project_id, :name, :status, :priority, :deadline)
    end
end
