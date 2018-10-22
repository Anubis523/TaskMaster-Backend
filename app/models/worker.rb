class Worker < ApplicationRecord
  belongs_to :project
  has_many :tasks, through: :project
  has_one :employer, through: :project
  # has_secure_password

  def select_task(task)
    if task.project_id == self.project_id
      # upon matching project id the rest can happen
      task.workers.clear 
      task.workers << self
      self.tasks << task
      task.save 
      taself.save
    end
  end
  
end
