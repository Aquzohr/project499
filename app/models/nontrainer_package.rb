class NontrainerPackage < ApplicationRecord
  has_many :members

  belongs_to :package, optional: true, dependent: :destroy

  validates :freeze_time, numericality: { other_than: 0 }

  def name
    if self.package.name
      self.package.name
    end
  end

end
