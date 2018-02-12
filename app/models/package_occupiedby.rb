class PackageOccupiedby < ApplicationRecord
	belongs_to :trainer_package
	belongs_to :member

  validates_presence_of :start_date, :end_date
  validates :balance_session, numericality: { other_than: 0 }


end
