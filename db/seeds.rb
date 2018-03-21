# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Adding Infomation to Database..."


#createBranch
1.upto(3) do |i|
	Branch.create(name: "Powerhouse Fitness Center"+ i.to_s, address: Faker::Address.building_number+' '+Faker::Address.city+' '+Faker::Address.state+' '+Faker::Address.country+' '+Faker::Address.zip)
end

#create Package

#create Nontrainer Packages
Package.create(name: "Annual",price: 9500)
NontrainerPackage.create(freeze_time: rand(0..6), package_id: 1)

Package.create(name: "6 Monthly",price: 3000)
NontrainerPackage.create(freeze_time: rand(0..3), package_id: 2)

Package.create(name: "3 Monthly",price: 1500)
NontrainerPackage.create(freeze_time: 0, package_id: 3)

Package.create(name: "1 Monthly",price: 950)
NontrainerPackage.create(freeze_time: 0, package_id: 4)

Package.create(name: "Day",price: 100)
NontrainerPackage.create(freeze_time: 0, package_id: 5)

#create Trainer Package
Package.create(name: "Personal Trainer",price: 8000)
TrainerPackage.create(session: 30, package_id: 6)

Package.create(name: "Boxing",price: 7000)
TrainerPackage.create(session: 20, package_id: 7)

Package.create(name: "GLG",price: 11200)
TrainerPackage.create(session: 50, package_id: 8)

Package.create(name: "Strength Training",price: 5000)
TrainerPackage.create(session: 30, package_id: 9)

Package.create(name: "Cardio Training",price: 3000)
TrainerPackage.create(session: 20, package_id: 10)

#Admin 
User.create(email: 'admin@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Admin', user_id: 1, branch_id: 1)

#Genaral Staff
User.create(email: 'staff@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Genaral', user_id: 2, branch_id: 1)

#Trainer
User.create(email: 'trainer@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
Staff.create(position: 'Trainer', user_id: 3, branch_id: 1)

#Member
User.create(email: 'member@powerhouse.com', password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'member')
Member.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: 4, nontrainer_package_id: 1)

####################################

#create Announcement
Announcement.create(title: 'วันนี้ทางยิมปิดบริการ 1 วัน', des: 'จะเปิดใช้บริการอีกที 6.00 น วันจันทร์', date: Faker::Date.backward(14))
Announcement.create(title: 'โซนใหม่ PINK ZONE', des: 'เปิดให้บริการ24 ชม.', date: Faker::Date.backward(14))
Announcement.create(title: 'ไม่อนุญาติให้สมาชิกเก็บสัมภาระไว้ในตู้ล๊อกเกอร์ค้างคืน', des: 'โดยได้มีการแจ้งระเบียบนี้ให้สมาชิกทราบแล้วทุกท่านตั้งแต่ตอนสมัครสมาชิกว่ามีบริการตู้เก็บสัมภาระฟรี และให้ใช้วันต่อวันเท่านั้น
', date: Faker::Date.backward(14))
Announcement.create(title: 'Sexy Dance Class', des: 'มาลองแล้วคุณจะรู้ ว่าใครๆ ก็เต้นได้', date: Faker::Date.backward(14))
Announcement.create(title: 'งดคลาส 90s Dance', des: 'ในวันเสาร์ที่ 24 กพ.นี้หนึ่งวันเนื่องจากจะมีการใช้ห้องคลาสราชันยิม', date: Faker::Date.backward(14))
Announcement.create(title: 'วันนี้วันเดียว สมัครสมาชิกหรือต่ออายุสมาชิก', des: 'นำใบเสร็จไปแลกบัตรกำนัล Starbucks มูลค่า 100 บาท #ฟรี ', date: Faker::Date.backward(14))


####################################

#create Staff
1.upto(30) do |i|
   User.create(email: Faker::Internet.unique.free_email, password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'staff')
end

position = ["Genaral","Trainer", "Admin"]

4.upto(33) do |i|
	Staff.create(position: position[rand(0..2)], user_id: i, branch_id: rand(1..3))
end

###################################

#create Member
1.upto(30) do |i|
   User.create(email: Faker::Internet.unique.free_email, password: 'password', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone, role: 'member')
end

k=2

34.upto(63) do |i|
	Member.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), user_id: i, nontrainer_package_id: 1)
  k=k+1;
end

###################################

#create Member
1.upto(30) do |i|
	PackageOccupiedby.create(start_date: Faker::Date.backward(14),end_date: Faker::Date.forward(23),balance_session: 0, trainer_package_id: rand(1..30), member_id: rand(1..30))
end

#####################

#Serve Checkin/checkout

Serve.create(checkin_time: "2018-03-15 05:42:14", checkout_time: "2018-03-15 05:42:37", staff_id: 2, member_id: 1)
Serve.create(checkin_time: "2018-03-14 07:42:14", checkout_time: "2018-03-14 07:42:37", staff_id: 2, member_id: 1)
Serve.create(checkin_time: "2018-03-13 03:42:14", checkout_time: "2018-03-13 03:42:37", staff_id: 2, member_id: 1)


###################

#Receipt
Receipt.create(customer_name: 'John', payment_method: 'Cash', des: '1 Monthly', price: 950, date: Faker::Date.backward(14), staff_id: 2)
Receipt.create(customer_name: 'Jab', payment_method: 'Cash', des: 'Day', price: 100, date: Faker::Date.backward(14), staff_id: 2)
Receipt.create(customer_name: 'Nami', payment_method: 'Credit Card', des: 'Annual', price: 9500, date: Date.today, staff_id: 2)

#############

#buy Trainer Package
PackageOccupiedby.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), balance_session: 10, trainer_package_id: 1, member_id: 1)
PackageOccupiedby.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), balance_session: 10, trainer_package_id: 2, member_id: 2)
PackageOccupiedby.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), balance_session: 10, trainer_package_id: 3, member_id: 3)
PackageOccupiedby.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), balance_session: 10, trainer_package_id: 4, member_id: 4)
PackageOccupiedby.create(start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), balance_session: 10, trainer_package_id: 5, member_id: 5)

############

#booking
Booking.create(start_datetime: "2018-03-15 04:00:00", end_datetime: "2018-03-15 05:00:00", status: 1, staff_id: 3, member_id: 1)
Booking.create(start_datetime: "2018-03-14 05:00:00", end_datetime: "2018-03-14 06:00:00", status: 1, staff_id: 3, member_id: 1)
Booking.create(start_datetime: "2018-03-13 06:00:00", end_datetime: "2018-03-13 07:00:00", status: 0, staff_id: 3, member_id: 1)

puts "Add Infomation to Database Complete!"