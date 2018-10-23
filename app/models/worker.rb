class Worker < ApplicationRecord
  belongs_to :employer
  has_many :projects, through: :employer
  has_many :tasks, through: :projects
  # has_secure_password

  attr_accessor :project
  # before_action :filter_tasks

  def select_task(task)
    if task.project_id == self.project.id
      # upon matching project id the rest can happen
      task.workers.clear 
      task.workers << self
      self.tasks << task
      task.save 
      self.save
    end
  end

end
