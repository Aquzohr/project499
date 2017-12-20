class Member < ApplicationRecord
	has_many :bookings
	has_many :staff, through: :bookings

	has_many :serves
	has_many :staff, through: :serves

	has_many :package_occupiedby
	has_many :trainer_package, through: :package_occupiedby

	belongs_to :user, optional: true, dependent: :destroy
	accepts_nested_attributes_for :user
	validates_associated :user

  def self.search(search)
	  wildcard_search = "%#{search}%"

	  joins(:user).where("member_id LIKE :search OR users.firstname LIKE :search", search: wildcard_search)
	end

  def self.fullname(id)
    member = Member.find(id)
    "#{member.firstname}  #{member.lastname}"
  end

	def edit_link(id)
	  "<a href='/members/#{id}/edit'>Edit</a>"
	end

	def remove_link(id)
	  "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/members/#{id}'>Destroy</a>"
	end

  def as_json(options={})

    if options[:index]
      return {
        member_id: self.member_id,
        fullname: "#{self.user.firstname} #{self.user.lastname}",
        phone: self.user.phone,
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
