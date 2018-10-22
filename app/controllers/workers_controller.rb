class WorkersController < ActionController::API

  def index 
    render json: Worker.all
  end

  def show
    find_worker
    render json: @worker
  end

  def show_tasks
    @worker = Worker.find(params[:id])
    render json: @worker.tasks
  end

    # patch '/workers/:id/task/:task_id' => 'workers#edit_task
  def edit_task
    find_worker
    task = @worker.tasks.find{|task| task.id == params[:task_id].to_i}
    if task.nil?
      render json: { error: 'Task does not exist.'}, status: 404
    else
      task.update!(task_params)
      render json: @worker.tasks
    end
  end

  def update_info
    find_worker
    @worker.update!(worker_params)
    render json: @worker
  end

  def my_boss
    find_worker
    render json: @worker.employer
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

  def task_params
    
  end
end
