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

ActiveRecord::Schema.define(version: 20151201074851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_memberships", ["course_id"], name: "index_course_memberships_on_course_id", using: :btree
  add_index "course_memberships", ["user_id", "course_id"], name: "index_course_memberships_on_user_id_and_course_id", using: :btree
  add_index "course_memberships", ["user_id"], name: "index_course_memberships_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.text     "name"
    t.text     "department"
    t.integer  "course_number"
    t.integer  "course_registration_number"
    t.text     "building"
    t.text     "room"
    t.time     "start_time"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "monday",                     default: false, null: false
    t.boolean  "tuesday",                    default: false, null: false
    t.boolean  "wednesday",                  default: false, null: false
    t.boolean  "thursday",                   default: false, null: false
    t.boolean  "friday",                     default: false, null: false
  end

  add_index "courses", ["course_registration_number"], name: "index_courses_on_course_registration_number", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["device_id"], name: "index_users_on_device_id", using: :btree

end
