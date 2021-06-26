class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.integer :member_id
      t.string :location
      t.integer :amount

      t.timestamps
    end
  end
end
