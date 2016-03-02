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

ActiveRecord::Schema.define(version: 20160301134756) do

  create_table "arts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "cat_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "arts", ["cat_id"], name: "index_arts_on_cat_id"
  add_index "arts", ["user_id"], name: "index_arts_on_user_id"

  create_table "arttags", force: :cascade do |t|
    t.integer  "art_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "arttags", ["art_id"], name: "index_arttags_on_art_id"
  add_index "arttags", ["tag_id"], name: "index_arttags_on_tag_id"

  create_table "cats", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chals", force: :cascade do |t|
    t.string   "name"
    t.text     "reg"
    t.integer  "dur"
    t.integer  "user_id"
    t.integer  "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chals", ["cat_id"], name: "index_chals_on_cat_id"
  add_index "chals", ["user_id"], name: "index_chals_on_user_id"

  create_table "chaltags", force: :cascade do |t|
    t.integer  "chal_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chaltags", ["chal_id"], name: "index_chaltags_on_chal_id"
  add_index "chaltags", ["tag_id"], name: "index_chaltags_on_tag_id"

  create_table "coms", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "art_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "p_id"
  end

  add_index "coms", ["art_id"], name: "index_coms_on_art_id"
  add_index "coms", ["user_id"], name: "index_coms_on_user_id"

  create_table "hits", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "chal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hits", ["chal_id"], name: "index_hits_on_chal_id"
  add_index "hits", ["user_id"], name: "index_hits_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "treats", force: :cascade do |t|
    t.string   "name"
    t.boolean  "md"
    t.text     "sym"
    t.text     "reg"
    t.integer  "user_id"
    t.integer  "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "treats", ["cat_id"], name: "index_treats_on_cat_id"
  add_index "treats", ["user_id"], name: "index_treats_on_user_id"

  create_table "treattags", force: :cascade do |t|
    t.integer  "treat_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "treattags", ["tag_id"], name: "index_treattags_on_tag_id"
  add_index "treattags", ["treat_id"], name: "index_treattags_on_treat_id"

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "moderator",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["username"], name: "index_users_on_username"

end
