class Receipt < ApplicationRecord
	belongs_to :staff
	belongs_to :member
end
