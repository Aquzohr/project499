class Package < ApplicationRecord
	has_one :nontrainer_package
	has_one :trainer_package

	accepts_nested_attributes_for :nontrainer_package
	accepts_nested_attributes_for :trainer_package
end
