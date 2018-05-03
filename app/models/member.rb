class Member < ApplicationRecord
	has_many :bookings
	has_many :staff, through: :bookings

	has_many :serves
	has_many :staff, through: :serves

	has_many :package_occupiedby
	has_many :trainer_package, through: :package_occupiedby

  has_many :receipts
  has_many :staffs, through: :receipts

  belongs_to :nontrainer_package

	belongs_to :user
	accepts_nested_attributes_for :user
	validates_associated :user

  validates :start_date,:end_date, presence: true

  def self.search(search)
	  wildcard_search = "%#{search}%"

	  joins(:user).where("CAST(members.id AS TEXT) LIKE :search OR users.firstname LIKE :search", search: wildcard_search)
	end

  def codeAndFullname
    code = "m%03d" % self.id
    "#{code}: #{self.user.firstname}  #{self.user.lastname}"
  end

  def OwnerPackage
    code = "m%03d" % self.id
    "#{code}: #{self.user.firstname}  #{self.user.lastname} | #{self.package_occupiedby.last.trainer_package.name}"
  end

  def OwnerPackageID
    self.package_occupiedby.last.trainer_package.id
  end

  def OwnerPackageQuata
    self.package_occupiedby.last.trainer_package.quata
  end

  def self.haveTrainer
    Member.joins(:package_occupiedby)
  end

	def edit_link(id)
	  "<a href='/members/#{id}/edit' class='btn btn-warning btn-block' data-turbolinks='false'>Edit</a>"
	end

  def as_json(options={})

    if options[:index]
      return {
        member_code: "m%03d" % self.id,
        fullname: "#{self.user.firstname} #{self.user.lastname}",
        phone: self.user.phone,
        nontrainer_package: self.nontrainer_package.name,
        start_date: self.start_date.strftime("%d/%m/%Y"),
        end_date: self.end_date.strftime("%d/%m/%Y"),
        freeze_count: self.freeze_count,
        edit: edit_link(self.id),
      }
    else
      super()
  	end

  end

end
