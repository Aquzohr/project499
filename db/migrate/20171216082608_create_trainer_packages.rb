class CreateTrainerPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :trainer_packages do |t|
      t.integer :session, null: false, default: 0

      t.timestamps
    end
  end
end
