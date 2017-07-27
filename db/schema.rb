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

ActiveRecord::Schema.define(version: 20170727025002) do

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "apt"
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", default: "US", null: false
    t.string "zip", null: false
    t.integer "user_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "author_circulations", force: :cascade do |t|
    t.integer "author_id", limit: 19, precision: 19
    t.integer "circulation_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "i_aut_cir_aut_id"
    t.index ["circulation_id"], name: "i_aut_cir_cir_id"
  end

  create_table "author_periodicals", force: :cascade do |t|
    t.integer "author_id", limit: 19, precision: 19
    t.integer "periodical_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "i_author_periodicals_author_id"
    t.index ["periodical_id"], name: "i_aut_per_per_id"
  end

  create_table "author_references", force: :cascade do |t|
    t.integer "author_id", limit: 19, precision: 19
    t.integer "reference_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "i_author_references_author_id"
    t.index ["reference_id"], name: "i_aut_ref_ref_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "circulations", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "cost", default: "0.0", null: false
    t.integer "holding_id", precision: 38, null: false
    t.integer "publisher_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holding_id"], name: "i_circulations_holding_id"
    t.index ["publisher_id"], name: "i_circulations_publisher_id"
  end

  create_table "community_users", force: :cascade do |t|
    t.datetime "expiration_dt", precision: 6, null: false
    t.integer "user_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "i_community_users_user_id"
  end

  create_table "holding_circulations", force: :cascade do |t|
    t.integer "holding_id", limit: 19, precision: 19
    t.integer "circulation_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["circulation_id"], name: "i_hol_cir_cir_id"
    t.index ["holding_id"], name: "i_hol_cir_hol_id"
  end

  create_table "holding_log_entries", force: :cascade do |t|
    t.integer "holding_id", limit: 19, precision: 19
    t.integer "log_entry_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holding_id"], name: "i_hol_log_ent_hol_id"
    t.index ["log_entry_id"], name: "i_hol_log_ent_log_ent_id"
  end

  create_table "holding_periodicals", force: :cascade do |t|
    t.integer "holding_id", limit: 19, precision: 19
    t.integer "periodical_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holding_id"], name: "i_hol_per_hol_id"
    t.index ["periodical_id"], name: "i_hol_per_per_id"
  end

  create_table "holding_references", force: :cascade do |t|
    t.integer "holding_id", limit: 19, precision: 19
    t.integer "reference_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holding_id"], name: "i_hol_ref_hol_id"
    t.index ["reference_id"], name: "i_hol_ref_ref_id"
  end

  create_table "holdings", force: :cascade do |t|
    t.string "title", null: false
    t.string "section", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "log_entries", force: :cascade do |t|
    t.integer "user_id", precision: 38, null: false
    t.integer "holding_section_id", precision: 38, null: false
    t.integer "item_id", precision: 38, null: false
    t.datetime "checkout_dt", precision: 6, null: false
    t.datetime "checkin_dt", precision: 6
    t.datetime "due_dt", precision: 6, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "periodicals", force: :cascade do |t|
    t.string "title", null: false
    t.integer "volume", precision: 38, default: 1, null: false
    t.integer "volume_no", precision: 38, default: 1, null: false
    t.integer "holding_id", precision: 38, null: false
    t.integer "publisher_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holding_id"], name: "i_periodicals_holding_id"
    t.index ["publisher_id"], name: "i_periodicals_publisher_id"
  end

  create_table "publisher_circulations", force: :cascade do |t|
    t.integer "publisher_id", limit: 19, precision: 19
    t.integer "circulation_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["circulation_id"], name: "i_pub_cir_cir_id"
    t.index ["publisher_id"], name: "i_pub_cir_pub_id"
  end

  create_table "publisher_periodicals", force: :cascade do |t|
    t.integer "publisher_id", limit: 19, precision: 19
    t.integer "periodical_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["periodical_id"], name: "i_pub_per_per_id"
    t.index ["publisher_id"], name: "i_pub_per_pub_id"
  end

  create_table "publisher_references", force: :cascade do |t|
    t.integer "publisher_id", limit: 19, precision: 19
    t.integer "reference_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publisher_id"], name: "i_pub_ref_pub_id"
    t.index ["reference_id"], name: "i_pub_ref_ref_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_publishers_on_name"
  end

  create_table "references", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle", null: false
    t.integer "publisher_id", precision: 38
    t.string "holding_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holding_id"], name: "index_references_on_holding_id"
    t.index ["publisher_id"], name: "i_references_publisher_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "rank", null: false
    t.integer "role", precision: 38, default: 2, null: false
    t.integer "user_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "class", precision: 38, default: 1, null: false
    t.string "major", null: false
    t.string "minor"
    t.integer "user_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "user_log_entries", force: :cascade do |t|
    t.integer "user_id", limit: 19, precision: 19
    t.integer "log_entry_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["log_entry_id"], name: "i_use_log_ent_log_ent_id"
    t.index ["user_id"], name: "i_user_log_entries_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "token", null: false
    t.string "hashed_password", null: false
    t.string "user_type", default: "STU", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["phone"], name: "index_users_on_phone"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "author_circulations", "authors"
  add_foreign_key "author_circulations", "circulations"
  add_foreign_key "author_periodicals", "authors"
  add_foreign_key "author_periodicals", "periodicals"
  add_foreign_key "author_references", "authors"
  add_foreign_key "author_references", "references"
  add_foreign_key "community_users", "users"
  add_foreign_key "holding_circulations", "circulations"
  add_foreign_key "holding_circulations", "holdings"
  add_foreign_key "holding_log_entries", "holdings"
  add_foreign_key "holding_log_entries", "log_entries"
  add_foreign_key "holding_periodicals", "holdings"
  add_foreign_key "holding_periodicals", "periodicals"
  add_foreign_key "holding_references", "holdings"
  add_foreign_key "holding_references", "references"
  add_foreign_key "publisher_circulations", "circulations"
  add_foreign_key "publisher_circulations", "publishers"
  add_foreign_key "publisher_periodicals", "periodicals"
  add_foreign_key "publisher_periodicals", "publishers"
  add_foreign_key "publisher_references", "publishers"
  add_foreign_key "publisher_references", "references"
  add_foreign_key "staffs", "users"
  add_foreign_key "students", "users"
  add_foreign_key "user_log_entries", "log_entries"
  add_foreign_key "user_log_entries", "users"
end
