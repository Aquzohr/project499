class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|

      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :status, null: false, default: 1
      

      t.belongs_to :staff, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps
    end
  end
end
