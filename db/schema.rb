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

ActiveRecord::Schema.define(version: 20140415160940) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "real_estate_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_files", force: true do |t|
    t.string   "file_name"
    t.string   "file_comment"
    t.integer  "real_estate_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", force: true do |t|
    t.string   "repar"
    t.string   "reval"
    t.integer  "real_estate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "details", ["real_estate_id", "created_at"], name: "index_details_on_real_estate_id_and_created_at"

  create_table "img_files", force: true do |t|
    t.string   "file_name"
    t.string   "file_comment"
    t.string   "real_estate_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "market_infos", force: true do |t|
    t.integer  "md_type"
    t.date     "info_date"
    t.date     "event_date"
    t.string   "info_source"
    t.string   "info_status"
    t.string   "info_contact"
    t.integer  "real_estate_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "value"
    t.integer  "value_type"
  end

  create_table "real_estates", force: true do |t|
    t.string   "rs_type"
    t.string   "locality"
    t.string   "address"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "surface"
    t.decimal  "area"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",          default: false
  end

end
