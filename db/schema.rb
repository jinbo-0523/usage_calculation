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

ActiveRecord::Schema.define(version: 2020_09_21_104212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amount_useds", force: :cascade do |t|
    t.date "date", null: false
    t.integer "sale", null: false
    t.bigint "recipe_id", null: false
    t.bigint "order_id", null: false
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_amount_useds_on_order_id"
    t.index ["recipe_id"], name: "index_amount_useds_on_recipe_id"
    t.index ["store_id"], name: "index_amount_useds_on_store_id"
    t.index ["user_id"], name: "index_amount_useds_on_user_id"
  end

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

  create_table "food_recipes", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_food_recipes_on_food_id"
    t.index ["recipe_id"], name: "index_food_recipes_on_recipe_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total", null: false
    t.string "unit", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order", default: 0, null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_orders_on_recipe_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "brand_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_recipes_on_brand_id"
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

  add_foreign_key "amount_useds", "orders"
  add_foreign_key "amount_useds", "recipes"
  add_foreign_key "amount_useds", "stores"
  add_foreign_key "amount_useds", "users"
  add_foreign_key "brands", "campanies"
  add_foreign_key "food_recipes", "foods"
  add_foreign_key "food_recipes", "recipes"
  add_foreign_key "orders", "recipes"
  add_foreign_key "recipes", "brands"
  add_foreign_key "shops", "brands"
  add_foreign_key "stores", "brands"
  add_foreign_key "users", "ranks"
end
