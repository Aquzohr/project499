class Package < ApplicationRecord
	has_one :nontrainer_package
	has_one :trainer_package

  validates_presence_of :name
  validates_uniqueness_of :name
  validates :price, numericality: { other_than: 0 }


end
