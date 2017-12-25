class Branch < ApplicationRecord
	has_many :staffs, dependent: :destroy
end
