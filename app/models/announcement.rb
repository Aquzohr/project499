class Announcement < ApplicationRecord
	belongs_to :staff

	validates_presence_of :title, :des


	def as_json(options={})

    if options[:index]
      return {
        title: "<h2 class='mb-4'>#{self.title}</h2>",
        des: self.des,
      }
    else
      super()
  	end

  end

end
