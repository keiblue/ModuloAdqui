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

ActiveRecord::Schema.define(version: 2019_07_12_235807) do

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
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", default: 1
    t.bigint "order_id", default: 1
    t.index ["item_id"], name: "index_details_on_item_id"
    t.index ["order_id"], name: "index_details_on_order_id"
  end

  create_table "items", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "provider_id", default: 1
    t.index ["provider_id"], name: "index_items_on_provider_id"
  end

  create_table "order_histories", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1
    t.bigint "order_id", default: 1
    t.bigint "status_id", default: 1
    t.index ["order_id"], name: "index_order_histories_on_order_id"
    t.index ["status_id"], name: "index_order_histories_on_status_id"
    t.index ["user_id"], name: "index_order_histories_on_user_id"
  end

  create_table "orders", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1
    t.bigint "provider_id", default: 1
    t.bigint "status_id", default: 1
    t.bigint "store_id", default: 1
    t.bigint "payment_id", default: 1
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["provider_id"], name: "index_orders_on_provider_id"
    t.index ["status_id"], name: "index_orders_on_status_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "method"
    t.integer "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "rut"
    t.string "rut_dv", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", default: 1
    t.bigint "service_id", default: 1
    t.bigint "agreement_id", default: 1
    t.index ["address_id"], name: "index_providers_on_address_id"
    t.index ["agreement_id"], name: "index_providers_on_agreement_id"
    t.index ["service_id"], name: "index_providers_on_service_id"
  end

  create_table "roles", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", default: 1
    t.index ["address_id"], name: "index_stores_on_address_id"
  end

  create_table "users", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "rutito"
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", default: 3
    t.string "rutito_dv", limit: 1, default: "1"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
