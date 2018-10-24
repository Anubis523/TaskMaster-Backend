class Worker < ApplicationRecord
  belongs_to :employer
  has_many :projects, through: :employer
  has_many :tasks, through: :projects
  # has_secure_password

  # before_action :filter_tasks

  def select_task(task)
    if task.project_id == self.assignment_id
      # upon matching project id the rest can happen
      task.set_worker(self)
      self.project.tasks << task
      self.save
    end
  end

  def project
    projects = Project.select{ |project| project.id == self.assignment_id}
    if projects.length < 1
      nil
    else
      projects.last
    end
  end

  def update_task(status, task)
    task.set_status(status)
  end

  def set_project(new_assignment)
    self.assignment_id = new_assignment.id
    self.save
  end

end
