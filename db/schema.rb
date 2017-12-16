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

ActiveRecord::Schema.define(version: 20171216084004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "des"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "staff_id"
    t.index ["staff_id"], name: "index_announcements_on_staff_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.string "time"
    t.bigint "staff_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_bookings_on_member_id"
    t.index ["staff_id"], name: "index_bookings_on_staff_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "member_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "freeze_count", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "nontrainer_packages", force: :cascade do |t|
    t.string "name"
    t.float "price", default: 0.0, null: false
    t.integer "freeze_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_occupiedbies", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "balance_session", default: 0, null: false
    t.bigint "trainer_package_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_package_occupiedbies_on_member_id"
    t.index ["trainer_package_id"], name: "index_package_occupiedbies_on_trainer_package_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trainer_package_id"
    t.bigint "nontrainer_package_id"
    t.bigint "staff_id"
    t.index ["nontrainer_package_id"], name: "index_receipts_on_nontrainer_package_id"
    t.index ["staff_id"], name: "index_receipts_on_staff_id"
    t.index ["trainer_package_id"], name: "index_receipts_on_trainer_package_id"
  end

  create_table "serves", force: :cascade do |t|
    t.string "checkin_time"
    t.string "checkout_time"
    t.date "date"
    t.bigint "staff_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_serves_on_member_id"
    t.index ["staff_id"], name: "index_serves_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "position"
    t.string "staff_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "trainer_packages", force: :cascade do |t|
    t.string "name"
    t.float "price", default: 0.0, null: false
    t.integer "session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announcements", "staffs"
  add_foreign_key "bookings", "members"
  add_foreign_key "bookings", "staffs"
  add_foreign_key "members", "users"
  add_foreign_key "package_occupiedbies", "members"
  add_foreign_key "package_occupiedbies", "trainer_packages"
  add_foreign_key "receipts", "nontrainer_packages"
  add_foreign_key "receipts", "staffs"
  add_foreign_key "receipts", "trainer_packages"
  add_foreign_key "serves", "members"
  add_foreign_key "serves", "staffs"
  add_foreign_key "staffs", "users"
end
