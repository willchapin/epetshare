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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140131030052) do

  create_table "locations", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "address",    :null => false
    t.string   "city",       :null => false
    t.string   "state",      :null => false
    t.string   "zip",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "content",      :null => false
    t.string   "title",        :null => false
    t.integer  "sender_id",    :null => false
    t.integer  "recipient_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pets", :force => true do |t|
    t.string   "name",             :null => false
    t.integer  "user_id",          :null => false
    t.string   "species",          :null => false
    t.string   "food_preferences"
    t.boolean  "is_social"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "breed"
  end

  add_index "pets", ["user_id", "name"], :name => "index_pets_on_user_id_and_name", :unique => true

  create_table "time_slots", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "start_time", :null => false
    t.datetime "end_time",   :null => false
    t.integer  "time_type",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname",                      :null => false
    t.string   "lastname",                       :null => false
    t.string   "email",                          :null => false
    t.string   "password_digest",                :null => false
    t.integer  "paw_points",      :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end
