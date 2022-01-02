class AddMeetToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :meeting, :boolean
    add_column :members, :outfitTop, :string
    add_column :members, :outfitBottom, :string
    add_column :members, :outfitShoes, :string
  end
end

