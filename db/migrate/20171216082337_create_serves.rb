class CreateServes < ActiveRecord::Migration[5.0]
  def change
    create_table :serves do |t|
      t.string :checkin_time
      t.string :checkout_time
      t.date :date

      t.belongs_to :staff, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps
    end
  end
end
