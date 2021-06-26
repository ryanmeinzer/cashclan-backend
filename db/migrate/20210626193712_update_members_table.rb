class UpdateMembersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :buying
    remove_column :members, :boolean
  end
end
