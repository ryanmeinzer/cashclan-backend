class ChangeDecimalToIntegerForTransactions < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :amount, :integer
  end
end
