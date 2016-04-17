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

ActiveRecord::Schema.define(version: 20160417080519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faalis_blog_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.boolean  "private"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "domain_id"
  end

  create_table "faalis_blog_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category_id"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "views"
    t.integer  "likes"
    t.integer  "dislikes"
    t.boolean  "allow_comments"
    t.string   "meta_title"
    t.string   "meta_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "domain_id"
  end

  add_index "faalis_blog_posts", ["category_id"], name: "index_faalis_blog_posts_on_category_id", using: :btree

  create_table "faalis_comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_comments", ["commentable_id", "commentable_type"], name: "index_faalis_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "faalis_comments", ["user_id"], name: "index_faalis_comments_on_user_id", using: :btree

  create_table "faalis_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_groups", ["role"], name: "index_faalis_groups_on_role", unique: true, using: :btree

  create_table "faalis_groups_permissions", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "group_id"
  end

  create_table "faalis_groups_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "faalis_groups_users", ["user_id", "group_id"], name: "by_user_and_group", unique: true, using: :btree

  create_table "faalis_permissions", force: :cascade do |t|
    t.string   "model"
    t.string   "permission_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_permissions", ["model"], name: "index_faalis_permissions_on_model", using: :btree

  create_table "faalis_user_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "reciver_id"
    t.boolean  "read_only"
    t.text     "content"
    t.text     "raw_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_user_messages", ["reciver_id"], name: "index_faalis_user_messages_on_reciver_id", using: :btree
  add_index "faalis_user_messages", ["sender_id"], name: "index_faalis_user_messages_on_sender_id", using: :btree

  create_table "faalis_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_users", ["email"], name: "index_faalis_users_on_email", unique: true, using: :btree
  add_index "faalis_users", ["reset_password_token"], name: "index_faalis_users_on_reset_password_token", unique: true, using: :btree
  add_index "faalis_users", ["unlock_token"], name: "index_faalis_users_on_unlock_token", unique: true, using: :btree

end