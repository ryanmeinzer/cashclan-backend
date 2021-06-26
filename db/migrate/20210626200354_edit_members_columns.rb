class EditMembersColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :email
    add_column :members, :location, :string
  end
end
