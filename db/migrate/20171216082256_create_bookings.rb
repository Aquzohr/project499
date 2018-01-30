class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :time

      t.belongs_to :staff, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps
    end
  end
end
