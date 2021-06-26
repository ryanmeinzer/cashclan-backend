class AddForeignKeysToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :seller_id, :integer
    add_column :transactions, :buyer_id, :integer
  end
end
