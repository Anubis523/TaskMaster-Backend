class Task < ApplicationRecord

  belongs_to :project
  has_one :employer, through: :project
  has_many :workers, through: :employer

  attr_accessor :worker

  def worker
    self.workers.first
  end

end