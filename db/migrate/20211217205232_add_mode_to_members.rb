class AddModeToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :mode, :string
  end
end
