class Announcement < ApplicationRecord
	belongs_to :staff

	validates_presence_of :title, :des, :start_datetime, :end_datetime
  validates :title, :uniqueness => {:scope => :start_datetime}


	def as_json(options={})

    if options[:index]
      return {
        title: "<h2 class='mb-4'> #{self.title}</h2>",
        des: "<h5>#{self.des}</h5>",
        start_datetime: "<h7>#{self.start_datetime.strftime('%a %d/%m/%Y')}</h7>",
      }
    else
      super()
  	end

  end

end
