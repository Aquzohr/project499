class Branch < ApplicationRecord
	has_many :staffs

	validates_presence_of :name, :address

  validates_uniqueness_of :name

end
