class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :des
      t.text :image_url
      t.date :start_datetime
      t.date :end_datetime

      t.timestamps
    end
  end
end
