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

ActiveRecord::Schema.define(version: 2019_12_15_190006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchanges", force: :cascade do |t|
    t.string "title"
    t.date "date_of_gifting"
    t.date "date_of_matching"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email"
    t.boolean "confirmed", default: false
    t.string "gift_to"
    t.bigint "exchange_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "received", default: false
    t.boolean "shipped", default: false
    t.bigint "user_id"
    t.index ["exchange_id"], name: "index_members_on_exchange_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "sub_email"
    t.string "type_of_sub"
    t.boolean "subscribed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "is_admin", default: false, null: false
    t.text "interests"
    t.text "books"
    t.text "movies"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "exchanges", "users"
  add_foreign_key "members", "exchanges"
  add_foreign_key "members", "users"
end
