# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2022_05_15_121838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "hstore"
  enable_extension "ltree"
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "all_postgres_types", id: :serial, force: :cascade do |t|
    t.string "string"
    t.text "text"
    t.integer "integer"
    t.float "float"
    t.decimal "decimal"
    t.datetime "datetime", precision: nil
    t.time "time"
    t.date "date"
    t.daterange "daterange"
    t.numrange "numrange"
    t.tsrange "tsrange"
    t.tstzrange "tstzrange"
    t.int4range "int4range"
    t.int8range "int8range"
    t.binary "binary"
    t.boolean "boolean"
    t.bigint "bigint"
    t.xml "xml"
    t.tsvector "tsvector"
    t.hstore "hstore"
    t.inet "inet"
    t.cidr "cidr"
    t.macaddr "macaddr"
    t.uuid "uuid"
    t.json "json"
    t.jsonb "jsonb"
    t.ltree "ltree"
    t.citext "citext"
    t.point "point"
    t.bit "bit", limit: 1
    t.bit_varying "bit_varying"
    t.money "money", scale: 2
  end

  create_table "blogs", force: :cascade do |t|
    t.string "subject"
    t.text "content"
    t.datetime "published_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "order_items", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.float "price"
    t.float "total"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "customer"
    t.datetime "ordered_at", precision: nil
    t.string "order_number"
  end

  create_table "pictures", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "file"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.string "sku"
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.float "price"
    t.boolean "featured"
    t.date "available_to_date"
    t.time "available_to_time"
    t.datetime "published_at", precision: nil
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "products_tags", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "tag_id", null: false
    t.index ["product_id", "tag_id"], name: "index_products_tags_on_product_id_and_tag_id", unique: true
    t.index ["product_id"], name: "index_products_tags_on_product_id"
    t.index ["tag_id"], name: "index_products_tags_on_tag_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "nickname"
    t.text "bio"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
