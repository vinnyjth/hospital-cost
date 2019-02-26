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

ActiveRecord::Schema.define(version: 2019_02_22_183920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospital_line_items", force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "line_item_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_hospital_line_items_on_hospital_id"
    t.index ["line_item_id"], name: "index_hospital_line_items_on_line_item_id"
    t.index ["price"], name: "index_hospital_line_items_on_price"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "address"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_hospitals_on_state"
  end

  create_table "line_items", force: :cascade do |t|
    t.string "label"
    t.index ["label"], name: "index_line_items_on_label"
  end

  create_table "scrapers", force: :cascade do |t|
    t.integer "hospital_id"
    t.string "strategy"
    t.string "url"
    t.text "scrape_config"
    t.datetime "last_run_at"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_scrapers_on_hospital_id"
  end

end
