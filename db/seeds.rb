# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

1.upto(3) do |i|
	Branch.create(name: Faker::Company.name, address: Faker::Address.building_number+' '+Faker::Address.city+' '+Faker::Address.state+' '+Faker::Address.country+' '+Faker::Address.zip)
end

1.upto(60) do |i|
   User.create(email: Faker::Internet.free_email, password: Faker::Internet.password, firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone)
end

1.upto(30) do |i|
	Staff.create(staff_id: 's'+Faker::Address.building_number, position: Faker::Job.position, user_id: i, branch_id: rand(1..3))
end

31.upto(60) do |i|
	Member.create(member_id: 'm'+Faker::Address.building_number, start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: i)
end

1.upto(30) do |i|
	Announcement.create(title: Faker::VentureBros.organization, des: Faker::VentureBros.quote, date: Faker::Date.forward(10))
end


#Admin
User.create(email: 'admin@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone)
Staff.create(position: 'Admin', staff_id: 'admin', user_id: 61, branch_id: 1)

puts "Fake Infomation Complete!!"