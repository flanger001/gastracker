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

ActiveRecord::Schema.define(version: 20160604144228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gas_entries", force: :cascade do |t|
    t.integer  "odometer",         default: 0
    t.float    "gallons",          default: 0.0
    t.float    "distance",         default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.string   "notes"
    t.float    "cost"
    t.integer  "user_id"
    t.integer  "station_id"
    t.integer  "vehicle_id"
    t.float    "price_per_gallon"
    t.string   "photo"
  end

  add_index "gas_entries", ["station_id"], name: "index_gas_entries_on_station_id", using: :btree
  add_index "gas_entries", ["user_id"], name: "index_gas_entries_on_user_id", using: :btree

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "year"
    t.string   "brand"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

end
