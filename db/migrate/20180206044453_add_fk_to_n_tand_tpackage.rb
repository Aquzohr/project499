class AddFkToNTandTpackage < ActiveRecord::Migration[5.0]
  def change
    add_reference :nontrainer_packages, :package, foreign_key: true
    add_reference :trainer_packages, :package, foreign_key: true
  end
end
