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

ActiveRecord::Schema.define(version: 2018_06_02_171916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_operator_califications", force: :cascade do |t|
    t.bigint "bus_operator_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_operator_id"], name: "index_bus_operator_califications_on_bus_operator_id"
  end

  create_table "bus_operators", force: :cascade do |t|
    t.string "internal_name"
    t.string "official_name"
    t.integer "recorrido_id"
    t.float "average_rating"
    t.string "slug"
    t.text "icons"
    t.text "images"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bus_operator_califications", "bus_operators"
end
