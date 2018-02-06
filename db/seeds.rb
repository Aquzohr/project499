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
	Branch.create(name: Faker::Company.name, address: Faker::Address.building_number+' '+Faker::Address.city+' '+Faker::Address.state+' '+Faker::Address.country+' '+Faker::Address.zip)
end

#create Package
1.upto(2) do |i|
	Package.create(name: Faker::Commerce.color,price: (Faker::Commerce.price).to_i * 1000)
end

#create Nontrainer Packages
NontrainerPackage.create(freeze_time: rand(0..50), package_id: 1)

#create Trainer Package
TrainerPackage.create(session: rand(0..50), package_id: 2)

#Admin
User.create(email: 'admin@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Admin', staff_code: 's001', user_id: 1, branch_id: 1)

#Staff
User.create(email: 'staff@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Staff', staff_code: 's002', user_id: 2, branch_id: 1)

#Member
User.create(email: 'member@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'member')
Member.create(member_code: 'm001', start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: 3, nontrainer_package_id: 1)


# #create USER
# 1.upto(30) do |i|
#    User.create(email: Faker::Internet.unique.free_email, password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
# end

# 1.upto(30) do |i|
#    User.create(email: Faker::Internet.unique.free_email, password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'member')
# end

# #create Staff
# position = ["Sale Representative","Trainer"]

# 1.upto(30) do |i|
# 	Staff.create(staff_id: 's'+Faker::Address.building_number, position: position[rand(0..1)], user_id: i, branch_id: rand(1..3))
# end

# #create Member
# 31.upto(60) do |i|
# 	Member.create(member_id: 'm'+Faker::Address.building_number, start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: i, nontrainer_package_id: rand(1..30))
# end

# #create Member
# 1.upto(30) do |i|
# 	PackageOccupiedby.create(start_date: Faker::Date.backward(14),end_date: Faker::Date.forward(23),balance_session: 0, trainer_package_id: rand(1..30), member_id: rand(1..30))
# end

# #create Announcement
# 1.upto(30) do |i|
# 	Announcement.create(title: Faker::VentureBros.organization, des: Faker::VentureBros.quote, date: Faker::Date.forward(10))
# end



puts "Fake Infomation Complete!"