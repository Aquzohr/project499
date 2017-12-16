class CreateTrainerPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :trainer_packages do |t|
      t.string :name
      t.float :price, null: false, default: 0
      t.integer :session

      t.timestamps
    end
  end
end
