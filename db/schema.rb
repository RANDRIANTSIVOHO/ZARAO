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

ActiveRecord::Schema.define(version: 2019_01_11_085310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "userjob_id"
    t.bigint "userservice_id"
    t.text "description"
    t.index ["userjob_id"], name: "index_comments_on_userjob_id"
    t.index ["userservice_id"], name: "index_comments_on_userservice_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "message"
  end

  create_table "interesteds", force: :cascade do |t|
    t.bigint "userjob_id"
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_interesteds_on_offer_id"
    t.index ["userjob_id"], name: "index_interesteds_on_userjob_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "userservice_id"
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.integer "delais"
    t.index ["userservice_id"], name: "index_offers_on_userservice_id"
  end

  create_table "userjobs", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.string "telephone"
    t.text "description"
    t.string "confirmation_token"
    t.boolean "confirmed", default: false
    t.decimal "price"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_userjobs_on_category_id"
  end

  create_table "userservices", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "telephone"
    t.string "password_digest"
    t.string "confirmation_token"
    t.boolean "confirmed", default: false
  end

end
