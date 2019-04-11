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

ActiveRecord::Schema.define(version: 2019_04_11_222504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gas_entries", id: :serial, force: :cascade do |t|
    t.integer "odometer", default: 0
    t.float "gallons", default: 0.0
    t.float "distance", default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "date"
    t.string "notes"
    t.float "cost"
    t.integer "station_id"
    t.integer "vehicle_id"
    t.float "price_per_gallon"
    t.string "photo"
    t.index ["station_id"], name: "index_gas_entries_on_station_id"
    t.index ["vehicle_id"], name: "index_gas_entries_on_vehicle_id"
  end

  create_table "stations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
  end

  create_table "user_stations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "station_id"
    t.boolean "favorite", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_user_stations_on_station_id"
    t.index ["user_id"], name: "index_user_stations_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "vehicles", id: :serial, force: :cascade do |t|
    t.string "year"
    t.string "brand"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  add_foreign_key "gas_entries", "stations"
  add_foreign_key "gas_entries", "vehicles"
  add_foreign_key "user_stations", "stations"
  add_foreign_key "user_stations", "users"
  add_foreign_key "vehicles", "users"
end
