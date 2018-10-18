class Task < ApplicationRecord
  belongs_to :project
  has_one :worker, through: :project
end
