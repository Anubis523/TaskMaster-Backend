class Project < ApplicationRecord
  has_many :tasks
  belongs_to :employer 
  has_many :workers, through: :employer
end
