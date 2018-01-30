class Announcement < ApplicationRecord
	belongs_to :staff

	validates_presence_of :title, :des

end
