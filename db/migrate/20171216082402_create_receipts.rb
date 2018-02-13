class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.string :customer_name
      t.string :payment_method
    	t.string :des
      t.integer :price, null: false, default: 0
      t.date :date

      t.timestamps
    end
  end
end
