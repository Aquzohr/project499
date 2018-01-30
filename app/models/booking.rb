class Booking < ApplicationRecord
	belongs_to :member
	belongs_to :staff
end
