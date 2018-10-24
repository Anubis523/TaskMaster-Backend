class Task < ApplicationRecord

  belongs_to :project
  has_one :employer, through: :project
  has_many :workers, through: :employer


  attr_accessor :worker_id

  
  def set_status(stat)
    status = stat
    self.update_columns(status: stat)
  end

  def set_worker(worker)
    @worker_id = worker.id
    set_status('WIP')
  end

  def worker 
    if worker_id
      Worker.find(worker_id)
    else
      null
    end
  end

end
