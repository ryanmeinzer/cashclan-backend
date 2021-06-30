class IncreaseLimit < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :googleId, :integer, limit: 8
  end
end
