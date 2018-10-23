class Task < ApplicationRecord

  belongs_to :project
  has_one :employer, through: :project
  has_many :workers, through: :employer
  validates :title, :desc, presence :true

  attr_accessor :worker

  def worker
    self.workers.first
  end

end