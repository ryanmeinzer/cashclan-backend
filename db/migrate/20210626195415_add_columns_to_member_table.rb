class AddColumnsToMemberTable < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :email, :string
    add_column :members, :amount, :integer
  end
end
