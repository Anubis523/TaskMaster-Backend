class Worker < ApplicationRecord
  belongs_to :employer
  has_many :projects, through: :employer
  has_many :tasks, through: :project
end
