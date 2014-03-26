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

ActiveRecord::Schema.define(version: 20140325113108) do

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
  end

  add_index "doctors", ["email"], name: "index_doctors_on_email", unique: true, using: :btree

  create_table "meetings", force: true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.time     "time_start"
    t.time     "time_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "skype"
    t.integer  "tel"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
