class AddActiveToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :active, :boolean
  end
end
