class Branch < ApplicationRecord
	has_many :staffs, dependent: :destroy

	validates_presence_of :name, :address

end
