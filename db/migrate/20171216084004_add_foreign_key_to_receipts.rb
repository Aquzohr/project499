class AddForeignKeyToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_reference :receipts, :trainer_package, foreign_key: true
    add_reference :receipts, :nontrainer_package, foreign_key: true
    add_reference :receipts, :staff, foreign_key: true
  end
end
