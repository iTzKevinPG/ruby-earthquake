# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_07_033744) do
  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "earthquake_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earthquake_id"], name: "index_comments_on_earthquake_id"
  end

  create_table "earthquakes", force: :cascade do |t|
    t.decimal "mag"
    t.string "place"
    t.bigint "time"
    t.bigint "updated"
    t.integer "tz"
    t.string "url"
    t.string "detail"
    t.integer "felt"
    t.decimal "cdi"
    t.decimal "mmi"
    t.string "alert"
    t.string "status"
    t.integer "tsunami"
    t.integer "sig"
    t.string "net"
    t.string "code"
    t.string "ids"
    t.string "sources"
    t.string "types"
    t.integer "nst"
    t.decimal "dmin"
    t.decimal "rms"
    t.decimal "gap"
    t.string "magType"
    t.string "eq_type"
    t.string "eq_id"
    t.decimal "longitude"
    t.decimal "latitude"
    t.decimal "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "seismology_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "earthquakes"
end
