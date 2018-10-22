class Task < ApplicationRecord

  belongs_to :project
  has_one :worker, through: :project
  has_many :workers, through: :project

  attr_accessor :worker

  def worker
    self.workers.first
  end

end