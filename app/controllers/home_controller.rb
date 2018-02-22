class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @announcements = Announcement.last(5)
  end
  
end
