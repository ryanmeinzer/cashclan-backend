class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :phone
      t.string :venmo
      t.boolean :selling
      t.string :buying
      t.string :boolean

      t.timestamps
    end
  end
end
