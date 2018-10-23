class Employer < ApplicationRecord
  has_many :projects
  has_many :workers
  has_many :tasks, through: :projects

  def hire(worker)
    worker.dept = self.dept
    worker.employer = self
    self.workers << worker
    worker.save
  end

  def transfer_worker(worker, new_employer)
    new_employer.hire(worker)
  end

  def remove_worker(worker_id)
    self.workers.delete(worker_id)
  end

end
