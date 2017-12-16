class Staff < ApplicationRecord
	has_many :announcements

	has_many :bookings
	has_many :member, through: :bookings

	has_many :serves
	has_many :member, through: :serves

	has_many :receipts
	has_many :nontrainer_packages, through: :receipts
	has_many :trainer_packages, through: :receipts

	belongs_to :user
end
