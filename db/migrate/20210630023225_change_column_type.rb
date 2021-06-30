class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :googleId, :string
  end
end
