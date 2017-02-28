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

ActiveRecord::Schema.define(version: 20170228100721) do

  create_table "deliveries", force: :cascade do |t|
    t.string   "dly_posnum"
    t.string   "dly_prefectures"
    t.string   "dly_municipality"
    t.string   "dly_streetnum"
    t.string   "dly_bill"
    t.string   "dly_contacts"
    t.string   "dly_remarks"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "supply_info_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "detail_page_url"
    t.string   "small_image"
    t.string   "medium_image"
    t.string   "large_image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "item_code"
  end

  add_index "items", ["item_code"], name: "index_items_on_item_code", unique: true

  create_table "ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ownerships", ["item_id"], name: "index_ownerships_on_item_id"
  add_index "ownerships", ["user_id", "item_id", "type"], name: "index_ownerships_on_user_id_and_item_id_and_type", unique: true
  add_index "ownerships", ["user_id"], name: "index_ownerships_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "gsname"
    t.string   "gsgoodsSize"
    t.date     "gsBestbeforeStart"
    t.date     "gs_BestbeforEnd"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "reliefs", force: :cascade do |t|
    t.integer  "gs_ID"
    t.string   "gs_name"
    t.string   "gs_sizeEvent"
    t.string   "gs_goodsSize"
    t.integer  "gs_dbweight"
    t.integer  "gs_dbboxcount"
    t.integer  "gs_dbboxsize"
    t.datetime "gs_BestbeforEnd"
    t.datetime "gs_BestbeforeStart"
    t.integer  "gs_NowNum"
    t.integer  "gs_shortages"
    t.string   "goos_note"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "gs_ExtraParts"
  end

  create_table "supply_infos", force: :cascade do |t|
    t.datetime "shs_today"
    t.string   "shs_name"
    t.string   "shs_sizeEvent"
    t.string   "shs_goodsSize"
    t.integer  "shs_Lackofgdsdbox"
    t.integer  "shs_Lackofgds"
    t.integer  "shs_Surplusitemdbox"
    t.integer  "shs_Surplusitem"
    t.integer  "shs_note"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "shs_sponsornamef"
    t.string   "shs_sponsorname"
    t.string   "shs_posnum"
    t.string   "shs_prefectures"
    t.string   "shs_municipality"
    t.string   "shs_streetnum"
    t.string   "shs_bill"
    t.string   "shs_contacts"
    t.string   "shs_remarks"
    t.integer  "supply_info_id"
  end

  add_index "supply_infos", ["user_id"], name: "index_supply_infos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "furigana"
    t.string   "post_num"
    t.string   "prefectures"
    t.string   "municipality"
    t.string   "area"
    t.string   "building"
    t.string   "tel"
    t.string   "fax"
    t.string   "userpicture"
  end

end
