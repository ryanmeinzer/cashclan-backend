class RemoveBuyingFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :buying
  end
end
