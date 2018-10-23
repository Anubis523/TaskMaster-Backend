class Task < ApplicationRecord

  belongs_to :project
  has_one :employer, through: :project
  has_many :workers, through: :employer

  validates :title, :desc, presence: true

  enum status: [:unassigned, :wip, :under_review, :complete]

end