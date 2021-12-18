class RemoveSellingToMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :selling
  end
end
