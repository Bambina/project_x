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

ActiveRecord::Schema.define(version: 20151029132947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "errands", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "shared_hash", null: false
    t.integer  "owner_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "errands", ["shared_hash"], name: "index_errands_on_shared_hash", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",                       null: false
    t.integer  "errand_id",                  null: false
    t.boolean  "done",       default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 50,                 null: false
    t.string   "email",                                      null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest",                            null: false
    t.boolean  "admin",                      default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
