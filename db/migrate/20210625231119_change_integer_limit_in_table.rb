class ChangeIntegerLimitInTable < ActiveRecord::Migration[6.0]
  def change
    change_column :givers, :phone, :integer, limit: 8
    change_column :getters, :phone, :integer, limit: 8
  end
end
