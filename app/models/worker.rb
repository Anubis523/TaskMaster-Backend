class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :employer
  has_many :projects, through: :employer
  has_many :tasks, through: :project
end
