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

ActiveRecord::Schema.define(version: 2019_06_01_050843) do

  create_table "addresses", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "region"
    t.string "comuna"
    t.string "calle"
    t.integer "numero"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agreements", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "code"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", default: 1
    t.bigint "order_id", default: 1
    t.index ["item_id"], name: "index_details_on_item_id"
    t.index ["order_id"], name: "index_details_on_order_id"
  end

