class Announcement < ApplicationRecord
	belongs_to :staff

	validates_presence_of :title, :des


	def as_json(options={})

    if options[:index]
      return {
        title: "<h2 class='mb-4'> #{self.title}</h2>",
        des: "<h5>#{self.des}</h5>",
        date: "<h7>#{self.date.strftime('%a %d/%m/%Y')}</h7>",
      }
    else
      super()
  	end

  end

end
