class Employer < ApplicationRecord
  has_many :workers
  has_many :projects
  has_many :tasks, through: :projects
end
