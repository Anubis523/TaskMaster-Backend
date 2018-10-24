require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
employer1 = Employer.create!(name: 'Ted Turner', username: 'theBoss', dept: 'broadcasting')
employer1.save
employer2 = Employer.create!(name: Faker::Name.name , username: 'techHead', dept: 'information technology')
employer2.save
project1 = Project.create!(title: 'Christmas Party', desc: 'Annual Company Christmas Party that is always the last Friday of Q4.', employer: employer1)

worker1 = Worker.create!(name: Faker::Name.name, username: Faker::Internet.username(6..12), employer: employer1)

worker2 = Worker.create!(name: Faker::Name.name, username: Faker::Internet.username(6..12), employer: employer1)

worker2.set_project(project1)

employer1.transfer_worker(worker1, employer2)
task1 = Task.create!(title: 'Buy presents', desc:'Buy some presents', project: project1)
worker2.select_task(task1)

# byebug
# 0
