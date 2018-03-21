class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :position
      t.integer :status, null: false, default: 1
      
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :branch, index: true, foreign_key: true


      t.timestamps
    end
  end
end
