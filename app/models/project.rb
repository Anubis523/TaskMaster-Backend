class Project < ApplicationRecord
  belongs_to :employer
  has_many :tasks
  has_many :workers
end
