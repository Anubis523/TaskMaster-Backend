class Project < ApplicationRecord
  belongs_to :employer
  has_many :tasks
  has_many :workers
  validates :title, :desc, presence: true


  def tasks_arr=(arr)
    arr.each do |task|
      self.tasks << Task.create(title: task["title"], desc: task["desc"])
    end
  end

end
