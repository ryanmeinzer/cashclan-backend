class AddColumnToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :googleId, :bigint
  end
end
