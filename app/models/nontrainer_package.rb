class NontrainerPackage < ApplicationRecord
  has_many :members

  belongs_to :package
  accepts_nested_attributes_for :package
  validates_associated :package

  #alidates :freeze_time, numericality: { other_than: -1 }

  def name
    if self.package.name
      self.package.name
    end
  end

end
