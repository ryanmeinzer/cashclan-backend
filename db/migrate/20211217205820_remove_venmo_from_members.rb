class RemoveVenmoFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :venmo
  end
end
