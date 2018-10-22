class ProjectsController < ApplicationController
  def get_tasks 
    @tasks = Project.find(params[:id]).tasks
    render json: @tasks
  end
end