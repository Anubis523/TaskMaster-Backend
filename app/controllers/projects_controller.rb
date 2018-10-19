class ProjectsController < ActionController::API
  def get_tasks 
    @tasks = Project.find(params[:id]).tasks
    render json: @tasks
  end
end