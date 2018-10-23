class Task < ApplicationRecord

  belongs_to :project
  has_one :employer, through: :project
  has_many :workers, through: :employer
  
  def set_status(stat)
    status = stat
    self.save
  end

end
