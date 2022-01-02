class RemoveMeetFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :meeting
    remove_column :members, :outfitTop
    remove_column :members, :outfitBottom
    remove_column :members, :outfitShoes
  end
end
