class AddStaffToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_reference :announcements, :staff, foreign_key: true
  end
end
