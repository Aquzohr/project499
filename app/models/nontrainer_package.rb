class NontrainerPackage < ApplicationRecord
  has_many :members

  belongs_to :package, optional: true, dependent: :destroy

  def name
    if self.package.name
      self.package.name
    end
  end

end
