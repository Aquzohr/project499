class CreateTrainerPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :trainer_packages do |t|
      t.string :name
      t.float :price, null: false, default: 0
      t.integer :session, null: false, default: 0

      t.timestamps
    end
  end
end
