# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151025072042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "meal_id"
    t.float    "quantity"
    t.string   "measurement"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "meal_ingredients", ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id", using: :btree
  add_index "meal_ingredients", ["meal_id"], name: "index_meal_ingredients_on_meal_id", using: :btree

  create_table "meal_plans", force: :cascade do |t|
    t.string   "dayOfWeek"
    t.boolean  "eaten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "meal_plan_id"
    t.string   "name"
    t.string   "imageURL"
    t.text     "cooking_instructions"
    t.integer  "likes"
    t.integer  "dislikes"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "meals", ["meal_plan_id"], name: "index_meals_on_meal_plan_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "meals"
end
