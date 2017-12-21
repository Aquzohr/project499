class CreatePackageOccupiedbies < ActiveRecord::Migration[5.0]
  def change
    create_table :package_occupiedbies do |t|
      t.date :start_date
      t.date :end_date
      t.integer :balance_session, null: false, default: 0

      t.belongs_to :trainer_package, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps
    end
  end
end
