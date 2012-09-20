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

ActiveRecord::Schema.define(:version => 20120920214004) do

  create_table "contact_types", :force => true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_members", ["event_id"], :name => "index_event_members_on_event_id"
  add_index "event_members", ["user_id"], :name => "index_event_members_on_user_id"

  create_table "events", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "duration"
    t.datetime "start_at"
    t.integer  "place_id"
    t.integer  "sport_id"
    t.integer  "max_number_members"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "events", ["owner_id"], :name => "index_events_on_owner_id"
  add_index "events", ["place_id"], :name => "index_events_on_place_id"
  add_index "events", ["sport_id"], :name => "index_events_on_sport_id"

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "locationable_id"
    t.string   "locationable_type"
    t.string   "address"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "locations", ["locationable_id"], :name => "index_locations_on_locationable_id"
  add_index "locations", ["locationable_type"], :name => "index_locations_on_locationable_type"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "icon"
  end

  add_index "places", ["location_id"], :name => "index_places_on_location_id"

  create_table "places_sports", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "sport_id"
  end

  create_table "slides", :force => true do |t|
    t.string   "file"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.string   "season"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "icon"
  end

  create_table "user_contacts", :force => true do |t|
    t.integer  "contact_type_id"
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "user_contacts", ["contact_type_id"], :name => "index_user_contacts_on_contact_type_id"
  add_index "user_contacts", ["user_id"], :name => "index_user_contacts_on_user_id"

  create_table "user_sports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sport_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_sports", ["sport_id"], :name => "index_user_sports_on_sport_id"
  add_index "user_sports", ["user_id"], :name => "index_user_sports_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "facebook_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "vkontakte_id"
    t.string   "twitter_id"
    t.string   "google_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
