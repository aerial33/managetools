# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Task.destroy_all

fouad = User.create( email: "fouad@aquiti.fr", password: "aquiti")
florent = User.create( email: "florent@aquiti.fr", password: "aquiti")


users = []
User.all.each do |user|
  users << user.email
end


Task.create( title: "Wagon's teaching", content: "Un premier cour avec le wagon sur RubyOnRails", completed: false, user_id: fouad.id)
Task.create( title: "wagon Crud teaching", content: "Un cour sur le CRUD avec Kitt", completed: false, user_id: fouad.id)
Task.create( title: "wagon Rails teaching", content: "Un cour sur Ruby on rails et activerecord", completed: false, user_id: fouad.id)
Task.create( title: "Codeplace first teach", content: "Creation d'un tool-manager moderne", completed: false, user_id: florent.id)

tasks = []
Task.all.each do |task|
  tasks << task.title
end

puts "User email : #{users}"
puts "Task Title : #{tasks}"
puts "==========================="

