class EmployersController < ActionController::API
  def my_projects #shows all projects
    @employer = Employer.find(params[:id])
    @projects = @employer.projects
    render json: @projects
  end

  def show_project #get specific project 
    @employer = Employer.find(params[:id])
    if get_project_info.nil?
      render json: @employer.projects
    else
      render json: get_project_info
    end
  end

  def show_employer 
    @employer = Employer.find(params[:id])
    render json: @employer
  end

  def get_tasks
    @employer = Employer.find(params[:id])
    @project = @employer.projects
  end

  def show_tasks #for a particular project
    get_project_info
    if get_project_info.nil? || @project.nil?
      render json: get_project_info.errors, status: :unprocessable_entitiy
    else
      if @project.tasks.nil? || @project.tasks.size < 1
        render json: get_project_info.errors, status: :unprocessable_entitiy # *NOTE: needs better error management
      else 
        render json: @project.tasks
      end
    end
  end

  def add_task
    @employer = Employer.find(params[:id])
    @project = @employer.projects.find{|project| project.id == params[:project_id].to_i}
    @project.tasks << Task.create!(title: params[:task][:title], desc: params[:task][:desc], project_id: @project.id)
    render json: @project.tasks.last
  end

  def edit_task
    @project = get_project_info
    @task = get_task_info
    if get_project_info.nil?
      my_projects
    else
      if get_task_info.nil?
        show_project
      else
        @task.update!(task_params)
        render json: @project.tasks
      end
    end
  end

  def my_workers
    @employer = Employer.find(params[:id])
    @workers = @employer.workers
    render json: @workers
  end

  def new_project
    @employer = Employer.find(params[:id])
    @employer.projects << Project.create!(employer_id: @employer.id, title: params[:project][:title])
    render json: @employer.projects.last
  end

  def edit_project # *NOTE:fix edits to only change what is given!!!
    @employer = Employer.find(params[:id])
    Project.update(params[:project_id].to_i, project: params[:project])
    render json: @employer.projects
  end

  def delete_project
    @employer = Employer.find(params[:id])
    @employer.projects.delete(Project.find(params[:project_id].to_i))
    render json: @employer.projects
  end

  def new_worker
    @employer = Employer.find(params[:id])
    @employer.workers << Worker.create!(employer_id: @employer.id, name: params[:worker][:name], username: params[:worker][:username], dept: @employer.dept)
    render json: @employer.workers.last
  end

  def remove_worker
    @employer = Employer.find(params[:id])
    @employer.projects.delete(Worker.find(params[:worker_id].to_i))
    render json: @employer.workers
  end
  
  private 
  def get_project_info
    @employer = Employer.find(params[:id])
    @project = @employer.projects.find{|project| project.id == params[:project_id].to_i}
  end

  def get_task_info
    @task = Task.find(params[:task_id])
  end
  # def person_params
  #   params.require(:person).permit(:name, :age)
  # end
  def task_params
    params.require(:task).permit(:title, :desc)
  end

  def worker_params
    params.require(:worker).permit(:name, :username)
  end

end
