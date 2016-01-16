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

ActiveRecord::Schema.define(version: 20160116021248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.float    "weight"
    t.integer  "repetitions"
    t.integer  "repetition_duration_seconds"
    t.integer  "rest_duration_seconds"
    t.boolean  "complete"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "status"
    t.string   "category"
    t.date     "founding_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.integer  "age"
    t.float    "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "category"
    t.string   "name"
    t.boolean  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
