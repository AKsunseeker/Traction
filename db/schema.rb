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

ActiveRecord::Schema.define(version: 20160118232859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biometrics", force: :cascade do |t|
    t.date     "date_of_birth"
    t.float    "weight"
    t.string   "gender"
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
    t.integer  "group_id"
    t.integer  "workout_id"
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
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.date     "join_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "handle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.boolean  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
