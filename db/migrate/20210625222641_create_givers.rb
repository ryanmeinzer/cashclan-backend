class CreateGivers < ActiveRecord::Migration[6.0]
  def change
    create_table :givers do |t|
      t.string :name
      t.integer :phone
      t.string :venmo
      t.string :location
      t.decimal :amount

      t.timestamps
    end
  end
end
