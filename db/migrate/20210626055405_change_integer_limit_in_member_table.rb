class ChangeIntegerLimitInMemberTable < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :phone, :integer, limit: 8
  end
end
