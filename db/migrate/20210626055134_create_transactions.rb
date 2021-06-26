class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.boolean :seller_confirmed
      t.boolean :buyer_confirmed
      t.string :status
      t.integer :amount
      t.string :location

      t.timestamps
    end
  end
end
