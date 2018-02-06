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

	belongs_to :user, optional: true, dependent: :destroy
	accepts_nested_attributes_for :user
	validates_associated :user

  validates :member_code, presence: true, uniqueness: true

  def self.search(search)
	  wildcard_search = "%#{search}%"

	  joins(:user).where("member_code LIKE :search OR users.firstname LIKE :search", search: wildcard_search)
	end

  def self.fullname(id)
    member = Member.find(id)
    "#{member.firstname}  #{member.lastname}"
  end

	def edit_link(id)
	  "<a href='/members/#{id}/edit' class='btn btn-warning btn-block'>Edit</a>"
	end

	def remove_link(id)
	  "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/members/#{id}' class='btn btn-danger btn-block'>Destroy</a>"
	end

  def as_json(options={})

    if options[:index]
      return {
        member_code: self.member_code,
        fullname: "#{self.user.firstname} #{self.user.lastname}",
        phone: self.user.phone,
        nontrainer_package: self.nontrainer_package.name,
        start_date: self.start_date,
        end_date: self.end_date,
        freeze_count: self.freeze_count,
        edit: edit_link(self.id),
        remove: remove_link(self.id),
      }
    else
      super()
  	end

  end

end
