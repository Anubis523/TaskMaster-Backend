class Worker < ApplicationRecord
  belongs_to :employer
  has_one :project, through: :employer
  has_many :tasks, through: :project
end
