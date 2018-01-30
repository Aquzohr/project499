class Serve < ApplicationRecord
	belongs_to :member
	belongs_to :staff

	validates_presence_of :member_id
end
