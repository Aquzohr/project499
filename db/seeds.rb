# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#createBranch
1.upto(3) do |i|
	Branch.create(name: "Powerhouse Fitness Center"+ i.to_s, address: Faker::Address.building_number+' '+Faker::Address.city+' '+Faker::Address.state+' '+Faker::Address.country+' '+Faker::Address.zip)
end

#create Package

#create Nontrainer Packages
Package.create(name: "Annule",price: (Faker::Commerce.price).to_i * 1000)
NontrainerPackage.create(freeze_time: rand(0..50), package_id: 1)

#create Trainer Package
Package.create(name: "Personal Trainer",price: (Faker::Commerce.price).to_i * 1000)
TrainerPackage.create(session: rand(0..50), package_id: 2)

#Admin 
User.create(email: 'admin@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Admin', staff_code: 's001', user_id: 1, branch_id: 1)

#Genaral Staff
User.create(email: 'staff@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Genaral', staff_code: 's002', user_id: 2, branch_id: 1)

#Trainer
User.create(email: 'trainer@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Trainer', staff_code: 's003', user_id: 3, branch_id: 1)

#Member
User.create(email: 'member@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'member')
Member.create(member_code: 'm001', start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: 4, nontrainer_package_id: 1)

####################################

#create Announcement
1.upto(30) do |i|
  Announcement.create(title: Faker::VentureBros.organization, des: Faker::VentureBros.quote, date: Faker::Date.forward(10))
end

####################################

#create Staff
1.upto(30) do |i|
   User.create(email: Faker::Internet.unique.free_email, password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
end

position = ["Genaral","Trainer", "Admin"]

4.upto(33) do |i|
	Staff.create(staff_code: "s%03d" % i, position: position[rand(0..2)], user_id: i, branch_id: rand(1..3))
end

###################################

#create Member
1.upto(30) do |i|
   User.create(email: Faker::Internet.unique.free_email, password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'member')
end

k=2

34.upto(63) do |i|
	Member.create(member_code: "m%03d" % k, start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: i, nontrainer_package_id: 1)
  k=k+1;
end

###################################

#create Member
1.upto(30) do |i|
	PackageOccupiedby.create(start_date: Faker::Date.backward(14),end_date: Faker::Date.forward(23),balance_session: 0, trainer_package_id: rand(1..30), member_id: rand(1..30))
end



puts "Fake Infomation Complete!"