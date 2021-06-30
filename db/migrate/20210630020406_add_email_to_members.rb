class AddEmailToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :email, :string
  end
end
