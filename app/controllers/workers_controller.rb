class WorkersController < ActionController::API

  def index
    render json: Worker.all
  end

  def show
    find_worker
    render json: @worker
  end

  def my_project
    @worker = find_worker
    if @worker.project.nil?
      render json: { error: 'Project not found. One can be assigned by a supervisor'}, status: 404
    else
      render json: @worker.project
    end
  end

  def show_tasks
    @worker = Worker.find(params[:id])
    render json: @worker.tasks
  end

  def edit_task
    find_worker
    @task = @worker.tasks.find{|task| task.id == params[:task_id].to_i}
    if @task.nil?
      render json: { error: 'Task does not exist.'}, status: 404
    else
      @task.update!(task_params)
      render json: @worker.tasks
    end
  end

  def remove_task
    find_worker
    @worker.project.tasks.delete(Task.find(params[:task_id]))
    render json: @worker.project.tasks
  end

  def update_info
    find_worker
    @worker.update(worker_params)
    render json: @worker
  end

  def get_worker_info
    find_worker
    render json: {
        employer:{
          name: @worker.employer.name,
          dept: @worker.employer.dept
        },
        worker: @worker,
        project: @worker.project,
        tasks: @worker.tasks
    }
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
    params.require(:worker).permit(:name, :username, :dept, :project_id, :assignment_id)
  end

  def task_params
    params.require(:task).permit(:title, :desc, :status)
  end
end
