class UpdateTransactionsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :premium, :integer
    add_column :transactions, :cost, :integer
    add_column :transactions, :profit, :integer
    add_column :transactions, :savings, :integer
    add_column :transactions, :buyer_offer_amount, :integer
    add_column :transactions, :buyer_offer_premium, :integer
    add_column :transactions, :seller_offer_amount, :integer
    add_column :transactions, :seller_offer_premium, :integer
  end
end
