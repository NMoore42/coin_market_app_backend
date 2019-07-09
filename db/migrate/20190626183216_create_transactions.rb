class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :crypto_id
      t.float :quantity
      t.string :coin

      t.timestamps
    end
  end
end
