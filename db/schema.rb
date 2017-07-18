# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170718011320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_prices", force: :cascade do |t|
    t.date "date"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_day_prices_on_unit_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "unit_id"
    t.string "rental_site"
    t.decimal "taxes_withheld"
    t.decimal "price"
    t.string "phone_number"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date "arrival_date"
    t.date "departure_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_inquiries_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "ad_name"
    t.decimal "tax_percent", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "day_prices", "units"
  add_foreign_key "inquiries", "units"
end
