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

ActiveRecord::Schema.define(version: 20160410205748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "user_username"
  end

  create_table "consoles", force: :cascade do |t|
    t.string   "title"
    t.boolean  "unlock"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "console_img_file_name"
    t.string   "console_img_content_type"
    t.integer  "console_img_file_size"
    t.datetime "console_img_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "category_id"
    t.string   "post_img_file_name"
    t.string   "post_img_content_type"
    t.integer  "post_img_file_size"
    t.datetime "post_img_updated_at"
    t.integer  "comment_id"
  end

  create_table "reponses", force: :cascade do |t|
    t.integer  "test_id"
    t.string   "user_username"
    t.string   "reponse_1"
    t.string   "reponse_2"
    t.string   "reponse_3"
    t.string   "reponse_4"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "note_1"
    t.float    "note_2"
    t.float    "note_3"
    t.float    "note_4"
    t.float    "total"
    t.string   "email"
    t.string   "appreciation"
    t.integer  "user_id"
    t.integer  "console_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "video_id"
    t.string   "video_title"
    t.string   "question_1"
    t.string   "answer_1"
    t.string   "question_2"
    t.string   "answer_2"
    t.string   "question_3"
    t.string   "answer_3"
    t.string   "question_4"
    t.string   "answer_4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "console_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "presence"
    t.float    "average"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.float    "score"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.integer  "console_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "video_img_file_name"
    t.string   "video_img_content_type"
    t.integer  "video_img_file_size"
    t.datetime "video_img_updated_at"
    t.text     "link"
    t.string   "style"
    t.date     "release"
    t.string   "genre"
    t.string   "player"
    t.string   "developer"
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "post_id"
    t.string   "user_username"
  end

end
