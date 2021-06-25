class ChangeDecimalToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :givers, :amount, :integer
    change_column :getters, :amount, :integer
  end
end
