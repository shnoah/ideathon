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

ActiveRecord::Schema.define(version: 20150817171557) do

  create_table "article_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "password"
    t.text     "contents"
    t.string   "my_image"
    t.string   "contact_kakao"
    t.string   "contact_email"
    t.string   "demo_link"
    t.string   "leader_name"
    t.string   "member_name"
    t.integer  "score",         default: 0
    t.integer  "like",          default: 0
    t.boolean  "fame",          default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "articles_tags", id: false, force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bests", force: :cascade do |t|
    t.integer  "todaybest_id"
    t.integer  "like"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "final_entries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "final_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "free_replies", force: :cascade do |t|
    t.string   "writer"
    t.string   "writer_email"
    t.integer  "freearticle_id"
    t.string   "contents"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "freearticles", force: :cascade do |t|
    t.string   "free_title"
    t.string   "free_writer"
    t.text     "free_article"
    t.string   "free_password"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hall_of_fames", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "re_replies", force: :cascade do |t|
    t.string   "writer"
    t.string   "writer_email"
    t.string   "contents"
    t.integer  "reply_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "replies", force: :cascade do |t|
    t.string   "writer"
    t.string   "writer_email"
    t.integer  "article_id"
    t.string   "contents"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.boolean  "liked",      default: false
    t.boolean  "selected",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tagging"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "name"
    t.string   "university"
    t.integer  "posting_check",          default: 0
    t.integer  "my_article_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
