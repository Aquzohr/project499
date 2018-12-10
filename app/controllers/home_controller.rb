class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index, :more_news]
  layout 'home'

  def index

    @announcements = Announcement.where("? >= start_datetime AND ? <= end_datetime", Time.now, Time.now).order(start_datetime: :desc).last(8)

  end

  def more_news
    @announcements = Announcement.where("? >= start_datetime AND ? <= end_datetime", Time.now, Time.now).order(start_datetime: :desc)
  end
  
end
