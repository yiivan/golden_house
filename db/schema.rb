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

ActiveRecord::Schema.define(version: 20160605164631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.date     "published_date"
    t.integer  "number_of_pages"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
    t.integer  "language_id"
    t.string   "image"
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree
  add_index "books", ["language_id"], name: "index_books_on_language_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_memos", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "memo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "extra_memos", ["memo_id"], name: "index_extra_memos_on_memo_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["book_id"], name: "index_favorites_on_book_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "memo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["memo_id"], name: "index_likes_on_memo_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "memos", force: :cascade do |t|
    t.text     "body"
    t.boolean  "public"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memos", ["book_id"], name: "index_memos_on_book_id", using: :btree
  add_index "memos", ["user_id"], name: "index_memos_on_user_id", using: :btree

  create_table "segments", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "memo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "segments", ["memo_id"], name: "index_segments_on_memo_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_foreign_key "books", "categories"
  add_foreign_key "books", "languages"
  add_foreign_key "extra_memos", "memos"
  add_foreign_key "favorites", "books"
  add_foreign_key "favorites", "users"
  add_foreign_key "likes", "memos"
  add_foreign_key "likes", "users"
  add_foreign_key "memos", "books"
  add_foreign_key "memos", "users"
  add_foreign_key "segments", "memos"
end
