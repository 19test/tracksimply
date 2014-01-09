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

ActiveRecord::Schema.define(version: 20140109182953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "clicks", force: true do |t|
    t.integer  "site_id"
    t.integer  "visitor_id"
    t.integer  "tracking_link_id"
    t.hstore   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clicks", ["site_id"], name: "index_clicks_on_site_id", using: :btree
  add_index "clicks", ["tracking_link_id"], name: "index_clicks_on_tracking_link_id", using: :btree
  add_index "clicks", ["visitor_id"], name: "index_clicks_on_visitor_id", using: :btree

  create_table "conversions", force: true do |t|
    t.integer  "click_id"
    t.decimal  "revenue",    precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversions", ["click_id"], name: "index_conversions_on_click_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracking_links", force: true do |t|
    t.integer  "site_id"
    t.string   "landing_page_url"
    t.string   "campaign"
    t.string   "source"
    t.string   "medium"
    t.string   "ad_content"
    t.string   "token"
    t.string   "sid"
    t.string   "cost_type"
    t.decimal  "cost",                  precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "landing_page_protocol",                          default: "http://"
  end

  add_index "tracking_links", ["site_id"], name: "index_tracking_links_on_site_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "auth_token"
    t.boolean  "admin",                           default: false
    t.string   "password_reset_token"
    t.datetime "password_reset_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
