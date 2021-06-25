class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :giver_id
      t.integer :getter_id
      t.boolean :giver_confirmed
      t.boolean :getter_confirmed
      t.string :status
      t.decimal :amount
      t.string :location

      t.timestamps
    end
  end
end
