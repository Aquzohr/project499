class NontrainerPackage < ApplicationRecord
  has_many :members

  belongs_to :package
  accepts_nested_attributes_for :package
  validates_associated :package

  validates :freeze_time, numericality: { other_than: 0 }

  def name
    if self.package.name
      self.package.name
    end
  end

end
