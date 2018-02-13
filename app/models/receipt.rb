class Receipt < ApplicationRecord
	belongs_to :staff
	belongs_to :member

  validates :customer_name,:payment_method, :des, :date, presence: true
  validates :price, numericality: { other_than: 0 }


end
