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

ActiveRecord::Schema.define(version: 20161006202532) do

  create_table "has_indicator_typers", force: :cascade do |t|
    t.integer  "stock_id",          limit: 4
    t.integer  "indicator_type_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "has_indicator_typers", ["indicator_type_id"], name: "index_has_indicator_typers_on_indicator_type_id", using: :btree
  add_index "has_indicator_typers", ["stock_id", "indicator_type_id"], name: "index_has_indicator_typers_on_stock_id_and_indicator_type_id", unique: true, using: :btree
  add_index "has_indicator_typers", ["stock_id"], name: "index_has_indicator_typers_on_stock_id", using: :btree

  create_table "indicator_types", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.float    "valor",             limit: 24
    t.date     "fecha"
    t.string   "signal",            limit: 255
    t.integer  "stock_id",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "indicator_type_id", limit: 4
  end

  add_index "indicators", ["fecha", "stock_id", "indicator_type_id"], name: "index_indicators_on_fecha_and_stock_id_and_indicator_type_id", unique: true, using: :btree

  create_table "markets", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "prices", force: :cascade do |t|
    t.float    "precio",     limit: 24
    t.date     "fecha"
    t.integer  "stock_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "prices", ["precio", "fecha"], name: "index_prices_on_precio_and_fecha", unique: true, using: :btree
  add_index "prices", ["stock_id"], name: "index_prices_on_stock_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.string   "ticker",      limit: 255
    t.string   "nombre",      limit: 255
    t.string   "descripcion", limit: 255
    t.integer  "market_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "stocks", ["market_id"], name: "index_stocks_on_market_id", using: :btree

  add_foreign_key "has_indicator_typers", "indicator_types"
  add_foreign_key "has_indicator_typers", "stocks"
  add_foreign_key "prices", "stocks"
  add_foreign_key "stocks", "markets"
end
