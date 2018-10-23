class Worker < ApplicationRecord
  belongs_to :employer
  has_one :project, through: :employer
  has_many :tasks, through: :project
  # has_secure_password

  def select_task(task)
    if task.project_id == self.project_id
      # upon matching project id the rest can happen
      task.workers.clear 
      task.workers << self
      self.tasks << task
      task.save 
      self.save
    end
  end  
end
