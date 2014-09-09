class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.js
      else
        format.js { render js: "alert(\"#{@project.errors.full_messages.join(', ')}\");" }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.user_id == current_user.id && @project.update(project_params)
        format.js
      else
        format.js { render js: "alert(\"#{@project.errors.full_messages.join(', ')}\");" }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy if @project.user_id == current_user.id
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
