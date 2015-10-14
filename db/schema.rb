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

ActiveRecord::Schema.define(version: 20150928100629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "product_details", force: :cascade do |t|
    t.integer "product_id"
    t.text    "meta_data"
  end

  add_index "product_details", ["product_id"], name: "index_product_details_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.float    "price"
    t.boolean  "featured"
    t.date     "available_to_date"
    t.time     "available_to_time"
    t.datetime "published_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "products_tags", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "tag_id",     null: false
  end

  add_index "products_tags", ["product_id", "tag_id"], name: "index_products_tags_on_product_id_and_tag_id", using: :btree
  add_index "products_tags", ["product_id"], name: "index_products_tags_on_product_id", using: :btree
  add_index "products_tags", ["tag_id"], name: "index_products_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

end
