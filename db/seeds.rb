# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Deforestation in progres....."
Forest.destroy_all

puts "Deleting existing users...."
User.destroy_all

puts "Creating new users / Forests"
# 15.times do
#   animal_test = Faker::Creature::Animal.name
#   tree_test = Faker::Coffee.blend_name
#   User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
#   Forest.create!(title: Faker::Restaurant.name, description: Faker::GreekPhilosophers.quote, address: Faker::Address.street_address,
#   tree: tree_test, animals: animal_test, price: rand(15...250), size: rand(5...15),
#   user: User.all.sample)
# end

puts "Done!"
