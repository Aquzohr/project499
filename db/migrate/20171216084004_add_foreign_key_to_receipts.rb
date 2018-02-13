class AddForeignKeyToReceipts < ActiveRecord::Migration[5.0]
  def change
    add_reference :receipts, :staff, foreign_key: true
  end
end
