class Booking < ApplicationRecord
	belongs_to :member
	belongs_to :staff

	validates_presence_of :time

end
