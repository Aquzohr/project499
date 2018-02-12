class Booking < ApplicationRecord
	belongs_to :member
	belongs_to :staff

	validates_presence_of :time, :date, :member_id, :staff_id

end
