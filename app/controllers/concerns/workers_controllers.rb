class WorkersController < ActionController::API

  def show
    find_worker
    render json: @worker
  end

  def update_info
    find_worker
    @worker.update!(worker_params)
    render json: @worker
  end

  def my_boss
    find_worker
    render json: @worker.project.employer
  end

  def my_tasks 
    find_worker
    render json: @worker.tasks
  end

  private
  def find_worker
    @worker = Worker.find(params[:id])
  end
  
  def worker_params
    params.require(:worker).permit(:name, :username, :dept, :project_id)
  end
end
