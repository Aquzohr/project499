class Receipt < ApplicationRecord
	belongs_to :staff
	belongs_to :member

  	validates :des, :date, presence: true

end
