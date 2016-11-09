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

ActiveRecord::Schema.define(version: 20161109021256) do

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.boolean  "friend_open",  default: false, null: false
    t.boolean  "general_open", default: false, null: false
    t.text     "icon"
    t.text     "coverimage"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "family_relationships", force: :cascade do |t|
    t.integer  "follow_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "family_relationships", ["follow_id", "follower_id"], name: "index_family_relationships_on_follow_id_and_follower_id", unique: true
  add_index "family_relationships", ["follow_id"], name: "index_family_relationships_on_follow_id"
  add_index "family_relationships", ["follower_id"], name: "index_family_relationships_on_follower_id"

  create_table "pictures", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "open_id",                                   null: false
    t.string   "name",                   default: "noname", null: false
    t.integer  "sex",                    default: 0,        null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "family_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["open_id"], name: "index_users_on_open_id", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
