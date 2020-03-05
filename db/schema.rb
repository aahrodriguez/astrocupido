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



ActiveRecord::Schema.define(version: 2020_03_05_174449) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "astrology_charts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sun_id"
    t.integer "moon_id"
    t.integer "ascendant_id"

  create_table "matches", force: :cascade do |t|
    t.integer "user_one_id"
    t.integer "user_two_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "interactions", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.boolean "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_interactions_on_receiver_id"
    t.index ["sender_id"], name: "index_interactions_on_sender_id"
  end

  create_table "signs", force: :cascade do |t|
    t.string "sign_name"
    t.string "icon_url"
    t.string "image_url"

  create_table "messages", force: :cascade do |t|
    t.integer "match_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "interactions", "users", column: "receiver_id"
  add_foreign_key "interactions", "users", column: "sender_id"
end
