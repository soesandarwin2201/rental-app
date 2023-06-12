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

ActiveRecord::Schema[7.0].define(version: 2023_06_12_154041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.string "zone"
    t.integer "zipcode"
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_addresses_on_house_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributions", force: :cascade do |t|
    t.string "phone"
    t.string "name"
    t.string "company"
    t.string "facebook"
    t.string "address"
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_attributions_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.string "country"
    t.string "house_status"
    t.string "house_type"
    t.float "latitude"
    t.float "longitude"
    t.float "price"
    t.date "update_date"
    t.string "detail"
    t.string "square"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "link"
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_images_on_house_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone"
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_phones_on_agent_id"
  end

  add_foreign_key "addresses", "houses"
  add_foreign_key "attributions", "houses"
  add_foreign_key "images", "houses"
  add_foreign_key "phones", "agents"
end
