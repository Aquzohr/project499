class Booking < ApplicationRecord
	belongs_to :member
	belongs_to :staff

	validates_presence_of :member_id, :staff_id

  validates :start_datetime, :end_datetime, :overlap => true

end
