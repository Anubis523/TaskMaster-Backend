class Project < ApplicationRecord
  belongs_to :employer
  has_many :tasks
  has_many :workers
  
  validates :title, :desc, presence: true
end
