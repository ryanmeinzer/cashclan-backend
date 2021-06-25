class CreateGetters < ActiveRecord::Migration[6.0]
  def change
    create_table :getters do |t|
      t.string :name
      t.integer :phone
      t.string :venmo
      t.string :location
      t.decimal :amount

      t.timestamps
    end
  end
end
