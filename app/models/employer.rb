class Employer < ApplicationRecord
  has_many :projects
  has_many :workers, through: :projects
  has_many :tasks, through: :projects
  # has_secure_password
  after_create :make_employee_pool

  attr_accessor :worker_pool_id

  def make_employee_pool
    employee_pool = Project.create!( title: 'Employee Pool', desc: 'A holding place for employees not yet assigned to a Project or are not available.', employer_id: self.id)
    self.projects << employee_pool
    self.worker_pool_id = employee_pool.id
  end

  def hire(worker)
    worker.project = get_employee_pool
    worker.dept = self.dept
    worker.save
  end

  # def deploy_worker(worker, project_id)
  #   worker.project_id = project_id
  #   worker.save
  # end

  def transfer_worker(worker, new_employer)
    new_employer.hire(worker)
  end

  def get_employee_pool
    Project.find(self.worker_pool_id)
  end
end
