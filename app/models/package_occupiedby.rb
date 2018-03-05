class PackageOccupiedby < ApplicationRecord
	belongs_to :trainer_package
	belongs_to :member

  validates_uniqueness_of :member_id, scope: :trainer_package_id
  validates_presence_of :trainer_package_id, :member_id, :start_date, :end_date
  validates :balance_session, numericality: { other_than: 0 }


end
