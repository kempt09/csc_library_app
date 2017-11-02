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

ActiveRecord::Schema.define(version: 20171102035720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "apt"
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", default: "US", null: false
    t.string "zip", null: false
    t.integer "admin_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "author_circulations", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "circulation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_circulations_on_author_id"
    t.index ["circulation_id"], name: "index_author_circulations_on_circulation_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circulation_log_entries", force: :cascade do |t|
    t.bigint "circulation_id"
    t.bigint "log_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circulation_id"], name: "index_circulation_log_entries_on_circulation_id"
    t.index ["log_entry_id"], name: "index_circulation_log_entries_on_log_entry_id"
  end

  create_table "circulations", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "cost"
    t.integer "author_id", null: false
    t.integer "publisher_id"
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_addresses", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customer_addresses_on_address_id"
    t.index ["customer_id"], name: "index_customer_addresses_on_customer_id"
  end

  create_table "customer_log_entries", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "log_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_log_entries_on_customer_id"
    t.index ["log_entry_id"], name: "index_customer_log_entries_on_log_entry_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone"
    t.string "name"
    t.integer "admin_id", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "log_entries", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "customer_id", null: false
    t.integer "circulation_id", null: false
    t.datetime "checkout_dt", null: false
    t.datetime "checkin_dt"
    t.datetime "due_dt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publisher_circulations", force: :cascade do |t|
    t.bigint "publisher_id"
    t.bigint "circulation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circulation_id"], name: "index_publisher_circulations_on_circulation_id"
    t.index ["publisher_id"], name: "index_publisher_circulations_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publishers_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "token", null: false
    t.string "hashed_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
  end

end
