# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_30_073537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.bigint "phone"
    t.string "venmo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount"
    t.string "location"
    t.string "googleId"
    t.string "email"
    t.string "mode"
    t.boolean "active"
    t.string "image"
    t.integer "premium"
  end

  create_table "transactions", force: :cascade do |t|
    t.boolean "seller_confirmed"
    t.boolean "buyer_confirmed"
    t.string "status"
    t.integer "amount"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "seller_id"
    t.integer "buyer_id"
  end

end
