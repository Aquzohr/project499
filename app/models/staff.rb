class Staff < ApplicationRecord
	has_many :announcements

	has_many :bookings
	has_many :member, through: :bookings

	has_many :serves
	has_many :member, through: :serves

	has_many :receipts
	has_many :nontrainer_packages, through: :receipts
	has_many :trainer_packages, through: :receipts

	belongs_to :branch, optional: true, dependent: :destroy

	belongs_to :user, optional: true, dependent: :destroy
	accepts_nested_attributes_for :user
	validates_associated :user

	def self.search(search)
	  wildcard_search = "%#{search}%"

	  joins(:user).where("staff_id LIKE :search OR users.firstname LIKE :search", search: wildcard_search)
	end

	def edit_link(id)
	  "<a href='/staffs/#{id}/edit'>Edit</a>"
	end

	def remove_link(id)
	  "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/staffs/#{id}'>Destroy</a>"
	end

  def as_json(options={})

    if options[:index]
      return {
        staff_id: self.staff_id,
        fullname: "#{self.user.firstname} #{self.user.lastname}",
        phone: self.user.phone,
        position: self.position,
        branch: self.branch.name,
        edit: edit_link(self.id),
        remove: remove_link(self.id),
      }
    else
      super()
  	end

  end
	
end
