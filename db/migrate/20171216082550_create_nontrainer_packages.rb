class CreateNontrainerPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :nontrainer_packages do |t|
      t.string :name
      t.float :price, null: false, default: 0
      t.integer :freeze_time, null: false, default: 0

      t.timestamps
    end
  end
end
