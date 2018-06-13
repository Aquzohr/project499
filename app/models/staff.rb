class Staff < ApplicationRecord
  has_many :announcements

  has_many :bookings
  has_many :member, through: :bookings

  has_many :serves
  has_many :member, through: :serves

  has_many :receipts
  has_many :members, through: :receipts

  belongs_to :branch

  belongs_to :user
  accepts_nested_attributes_for :user
  validates_associated :user
  
  def self.search(search)
    wildcard_search = "%#{search}%"

    joins(:user).where("staff_code LIKE :search OR users.firstname LIKE :search", search: wildcard_search)
  end

  def codeAndFullname
    "#{self.staff_code}: #{self.user.firstname}  #{self.user.lastname}"
  end

  def edit_link(id)
    "<a href='/staffs/#{id}/edit' class='btn btn-warning btn-block' data-turbolinks='false'>Edit</a>"
  end

  def show_status
    if self.status == 1
      "Working"
    else
      "Retire"
    end
  end

  def as_json(options={})

    if options[:index]
      return {
        staff_code: self.staff_code,
        fullname: "#{self.user.firstname} #{self.user.lastname}",
        phone: self.user.phone,
        position: self.position,
        branch: self.branch.name,
        status: self.show_status,
        edit: edit_link(self.id),
      }
    else
      super()
    end

  end
  
end
