class Receipt < ApplicationRecord
	belongs_to :staff
	belongs_to :nontrainer_package
	belongs_to :trainer_package
end
