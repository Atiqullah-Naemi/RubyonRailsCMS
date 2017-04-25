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

ActiveRecord::Schema.define(version: 20170421150730) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "message"
    t.boolean  "status"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.string   "first_button"
    t.string   "second_button"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "post_categories", force: :cascade do |t|
    t.integer  "Post_id"
    t.integer  "Category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["Category_id"], name: "index_post_categories_on_Category_id"
    t.index ["Post_id"], name: "index_post_categories_on_Post_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer  "Post_id"
    t.integer  "Tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Post_id"], name: "index_post_tags_on_Post_id"
    t.index ["Tag_id"], name: "index_post_tags_on_Tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "tag_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "site_name"
    t.integer  "posts_per_page"
    t.string   "logo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "image"
    t.text     "text"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_sliders_on_page_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
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
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
