class PackageOccupiedby < ApplicationRecord
	belongs_to :trainer_package
	belongs_to :member
end
