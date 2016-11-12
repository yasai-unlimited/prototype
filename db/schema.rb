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

ActiveRecord::Schema.define(version: 20161111093950) do

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

  create_table "family_post_images", force: :cascade do |t|
    t.integer  "family_post_id"
    t.text     "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "family_post_images", ["family_post_id", "created_at"], name: "index_family_post_images_on_family_post_id_and_created_at"

  create_table "family_post_stars", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "family_post_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "family_post_stars", ["family_id", "family_post_id"], name: "index_family_post_stars_on_family_id_and_family_post_id", unique: true
  add_index "family_post_stars", ["family_id"], name: "index_family_post_stars_on_family_id"
  add_index "family_post_stars", ["family_post_id"], name: "index_family_post_stars_on_family_post_id"

  create_table "family_posts", force: :cascade do |t|
    t.integer  "family_id"
    t.text     "content"
    t.integer  "stars_count",  default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "friend_open",  default: false
    t.boolean  "general_open", default: false
  end

  add_index "family_posts", ["family_id", "created_at"], name: "index_family_posts_on_family_id_and_created_at"
  add_index "family_posts", ["family_id"], name: "index_family_posts_on_family_id"

  create_table "family_relationships", force: :cascade do |t|
    t.integer  "follow_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "family_relationships", ["follow_id", "follower_id"], name: "index_family_relationships_on_follow_id_and_follower_id", unique: true
  add_index "family_relationships", ["follow_id"], name: "index_family_relationships_on_follow_id"
  add_index "family_relationships", ["follower_id"], name: "index_family_relationships_on_follower_id"

  create_table "question_images", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_images", ["question_id"], name: "index_question_images_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "general_open"
    t.boolean  "friend_open"
    t.boolean  "family_open"
    t.integer  "family_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "questions", ["family_id", "user_id", "created_at"], name: "index_questions_on_family_id_and_user_id_and_created_at"
  add_index "questions", ["family_id"], name: "index_questions_on_family_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "sns_comments", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "family_post_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "content"
  end

  add_index "sns_comments", ["family_id", "family_post_id", "user_id"], name: "index_sns_comments_on_family_id_and_family_post_id_and_user_id"
  add_index "sns_comments", ["family_id"], name: "index_sns_comments_on_family_id"
  add_index "sns_comments", ["family_post_id"], name: "index_sns_comments_on_family_post_id"
  add_index "sns_comments", ["user_id"], name: "index_sns_comments_on_user_id"

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
