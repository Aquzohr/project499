class Booking < ApplicationRecord
	belongs_to :member
	belongs_to :staff

	validates_presence_of :start_datetime, :end_datetime

  validates :start_datetime, :end_datetime, :overlap => {:scope => [:member_id], :message_title => [:start_datetime, :end_datetime], :message_content => "Start and End Datetime has already in Booking."}

end
