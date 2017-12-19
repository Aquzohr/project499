class Member < ApplicationRecord
	has_many :bookings
	has_many :staff, through: :bookings

	has_many :serves
	has_many :staff, through: :serves

	has_many :package_occupiedby
	has_many :trainer_package, through: :package_occupiedby

	belongs_to :user, optional: true, dependent: :destroy
	accepts_nested_attributes_for :user
	validates_associated :user
end
