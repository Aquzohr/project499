class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :position
      t.string :staff_id

      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
