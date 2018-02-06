class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
    	t.string :des
      t.date :date

      t.timestamps
    end
  end
end
