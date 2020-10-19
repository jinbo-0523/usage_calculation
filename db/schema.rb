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

ActiveRecord::Schema.define(version: 2020_10_18_135450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id"
    t.boolean "display", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id", "name"], name: "index_brands_on_company_id_and_name", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "food_recipes", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "recipe_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id", "recipe_id"], name: "index_food_recipes_on_food_id_and_recipe_id", unique: true
    t.index ["food_id"], name: "index_food_recipes_on_food_id"
    t.index ["recipe_id"], name: "index_food_recipes_on_recipe_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total", null: false
    t.string "unit", null: false
    t.boolean "display", default: true, null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id", "name"], name: "index_foods_on_company_id_and_name", unique: true
    t.index ["company_id"], name: "index_foods_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "count", default: 0, null: false
    t.bigint "recipe_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id", "report_id"], name: "index_orders_on_recipe_id_and_report_id", unique: true
    t.index ["recipe_id"], name: "index_orders_on_recipe_id"
    t.index ["report_id"], name: "index_orders_on_report_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "display", default: true, null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id", "name"], name: "index_ranks_on_company_id_and_name", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "brand_id", null: false
    t.boolean "display", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id", "name"], name: "index_recipes_on_brand_id_and_name", unique: true
    t.index ["brand_id"], name: "index_recipes_on_brand_id"
  end

  create_table "reports", force: :cascade do |t|
    t.date "date", null: false
    t.integer "sale", null: false
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id", "date"], name: "index_reports_on_shop_id_and_date", unique: true
    t.index ["shop_id"], name: "index_reports_on_shop_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.bigint "brand_id", null: false
    t.boolean "display", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id", "name"], name: "index_shops_on_brand_id_and_name", unique: true
    t.index ["brand_id"], name: "index_shops_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "employee_id"
    t.bigint "rank_id", null: false
    t.boolean "display", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_users_on_employee_id"
    t.index ["rank_id"], name: "index_users_on_rank_id"
  end

  add_foreign_key "brands", "companies"
  add_foreign_key "food_recipes", "foods"
  add_foreign_key "food_recipes", "recipes"
  add_foreign_key "foods", "companies"
  add_foreign_key "orders", "recipes"
  add_foreign_key "orders", "reports"
  add_foreign_key "ranks", "companies"
  add_foreign_key "recipes", "brands"
  add_foreign_key "reports", "shops"
  add_foreign_key "reports", "users"
  add_foreign_key "shops", "brands"
  add_foreign_key "users", "ranks"
end
