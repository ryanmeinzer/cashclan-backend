class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :buying, :boolean
  end
end
