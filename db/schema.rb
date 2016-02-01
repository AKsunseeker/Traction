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

ActiveRecord::Schema.define(version: 20160201200345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biometrics", force: :cascade do |t|
    t.float    "weight"
    t.float    "body_fat_percentage"
    t.float    "chest"
    t.float    "height"
    t.float    "waist"
    t.float    "shoulder"
    t.float    "hips"
    t.float    "biceps"
    t.float    "ape_index"
    t.float    "thigh"
    t.float    "calf"
    t.float    "forearm"
    t.float    "wrist"
    t.float    "neck"
    t.date     "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.float    "weight"
    t.integer  "repetitions"
    t.integer  "repetition_duration_seconds"
    t.integer  "rest_duration_seconds"
    t.boolean  "complete"
    t.integer  "workout_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "youtube_url"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.date     "founding_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "locations", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "locations", ["addressable_type", "addressable_id"], name: "index_locations_on_addressable_type_and_addressable_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.date     "join_date"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "handle"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "roles"
    t.string   "provider"
    t.string   "uid"
    t.date     "date_of_birth"
    t.string   "gender"
    t.integer  "trainer_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.boolean  "complete"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "original"
    t.integer  "category_id"
    t.integer  "created_by_user"
  end

  add_index "workouts", ["category_id"], name: "index_workouts_on_category_id", using: :btree

  add_foreign_key "workouts", "categories"
end
