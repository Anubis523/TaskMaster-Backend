class Task < ApplicationRecord
  belongs_to :project
  has_one :employer, through: :project
  belongs_to :worker, optional: true
end
