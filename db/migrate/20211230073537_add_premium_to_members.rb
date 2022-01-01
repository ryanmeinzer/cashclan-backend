class AddPremiumToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :premium, :integer
  end
end

