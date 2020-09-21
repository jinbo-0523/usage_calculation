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

ActiveRecord::Schema.define(version: 2020_09_21_084951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "campany_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campany_id"], name: "index_brands_on_campany_id"
  end

  create_table "campanies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_campanies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_campanies_on_reset_password_token", unique: true
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_shops_on_brand_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "brand_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_stores_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "employee_number", default: 0, null: false
    t.bigint "rank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rank_id"], name: "index_users_on_rank_id"
  end

  add_foreign_key "brands", "campanies"
  add_foreign_key "shops", "brands"
  add_foreign_key "stores", "brands"
  add_foreign_key "users", "ranks"
end
