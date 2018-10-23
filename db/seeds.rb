require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
employer1 = Employer.new(name: 'Ted Turner', username: 'theBoss', dept: 'broadcasting')
employer1.save

employer2 = Employer.new(name: Faker::Name.name , username: 'techHead', dept: 'information technology')
employer2.save

project1 = Project.new(title: 'Christmas Party', desc: 'Annual Company Christmas Party that is always the last Friday of Q4.', employer: employer1)
project1.save

worker1 = Worker.new(name: Faker::Name.name, username: Faker::Internet.username(6..12))
worker1.save

worker2 = Worker.new(name: Faker::Name.name, username: Faker::Internet.username(6..12))
worker2.save

employer1.hire(worker1)
employer1.hire(worker2)

worker2.project =  project1

employer1.transfer_worker(worker1, employer2)
task1 = Task.new(title: 'Buy presents', desc:'Buy some presents', project: project1)
task1.save

# worker2.select_task(task1)
byebug
0
