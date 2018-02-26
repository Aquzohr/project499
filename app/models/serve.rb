class Serve < ApplicationRecord
	belongs_to :member
	belongs_to :staff

	validates_presence_of :member_id

  validates :checkin_time, :checkout_time, :overlap => {scope: :member_id ,:message_title => [:checkin_time, :checkout_time], :message_content => "Start and End Datetime has already in Booking."}

end
