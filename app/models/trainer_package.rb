class TrainerPackage < ApplicationRecord
  has_many :package_occupiedby
	has_many :members, through: :package_occupiedby

  has_many :receipts
	has_many :nontrainer_packages, through: :receipts
	has_many :staffs, through: :receipts

	validates_presence_of :name

end
