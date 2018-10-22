class EmployersController < ActionController::API
  def create_employer
    @employer = Employer.new(employer_params)
    @employer.save
    # *NOTE: switch out for the employer#hire method instead, it fixes a lot of this crap
  end

  def my_projects # shows all projects
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
    render json: @employer.workers
  end

  def new_project
    @employer = Employer.find(params[:id])
    @employer.projects << Project.create!(employer_id: @employer.id, title: params[:project][:title], desc: params[:project][:title], tasks_arr: params[:project][:tasks])
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
    new_hire = Worker.create!(name: params[:worker][:name], username: params[:worker][:username], password: params[:worker][:password], email: params[:worker][:email], dept: @employer.dept, employer_id: @employer.id)
    @employer.hire(new_hire)
    render json: new_hire
  end

  def remove_worker
    @employer = Employer.find(params[:id])
    @employer.remove_worker(params[:worker_id])
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

  def task_params
    params.require(:task).permit(:title, :desc)
  end

  def worker_params
    params.require(:worker).permit(:name, :username)
  end

  def employer_params
    params.require(:employer).permit(:name, :username, :dept, :email)
  end

end
