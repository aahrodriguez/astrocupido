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

ActiveRecord::Schema.define(version: 2020_03_10_144300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "astrology_charts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sun_id"
    t.integer "moon_id"
    t.integer "ascendant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "birthdate"
    t.string "birth_city"
    t.float "latitude"
    t.float "longitude"
    t.bigint "state_id"
    t.index ["state_id"], name: "index_astrology_charts_on_state_id"
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

  create_table "matches", force: :cascade do |t|
    t.integer "user_one_id"
    t.integer "user_two_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "match_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "sign_matches", force: :cascade do |t|
    t.bigint "sign_one_id"
    t.bigint "sign_two_id"
    t.integer "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sign_one_id"], name: "index_sign_matches_on_sign_one_id"
    t.index ["sign_two_id"], name: "index_sign_matches_on_sign_two_id"
  end

  create_table "signs", force: :cascade do |t|
    t.string "sign_name"
    t.string "icon_url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "state_name"
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
    t.string "username"
    t.text "description"
    t.string "gender"
    t.boolean "like_woman"
    t.boolean "like_man"
    t.string "current_address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["state_id"], name: "index_users_on_state_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "astrology_charts", "states"
  add_foreign_key "interactions", "users", column: "receiver_id"
  add_foreign_key "interactions", "users", column: "sender_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "sign_matches", "signs", column: "sign_one_id"
  add_foreign_key "sign_matches", "signs", column: "sign_two_id"
end
