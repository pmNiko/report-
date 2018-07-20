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

ActiveRecord::Schema.define(version: 2018_07_20_221108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.integer "ticket"
    t.string "client"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1
    t.bigint "team_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "kind", default: 1
    t.text "observation"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_claims_on_author_id"
    t.index ["team_id"], name: "index_claims_on_team_id"
  end

  create_table "claims_jobs", force: :cascade do |t|
    t.integer "claim_id"
    t.integer "job_id"
  end

  create_table "dreports", force: :cascade do |t|
    t.date "date"
    t.integer "truck"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "news"
    t.string "brand"
  end

  create_table "dreports_users", id: false, force: :cascade do |t|
    t.integer "dreport_id"
    t.integer "user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "star_time"
    t.datetime "end_time"
    t.integer "type_event"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_users", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.float "code"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "claim_id"
    t.integer "item"
    t.index ["claim_id"], name: "index_materials_on_claim_id"
  end

  create_table "measures", force: :cascade do |t|
    t.integer "point"
    t.text "log"
    t.bigint "claim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_id"], name: "index_measures_on_claim_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "teams", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "truck_id"
    t.boolean "finished", default: false
    t.index ["truck_id"], name: "index_teams_on_truck_id"
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "number"
    t.string "client"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.float "job_cod_1"
    t.float "job_cod_2"
    t.float "job_cod_3"
    t.float "job_cod_4"
    t.float "job_cod_5"
    t.float "job_cod_6"
    t.text "observation"
    t.bigint "dreport_id"
    t.integer "mat_qty_1"
    t.integer "mat_qty_2"
    t.integer "mat_qty_3"
    t.integer "mat_qty_4"
    t.integer "mat_qty_5"
    t.integer "mat_qty_6"
    t.integer "meas_p1"
    t.integer "meas_p2"
    t.integer "meas_p3"
    t.integer "meas_p4"
    t.integer "meas_p5"
    t.integer "meas_p6"
    t.text "meas_log1"
    t.text "meas_log2"
    t.text "meas_log3"
    t.text "meas_log4"
    t.text "meas_log5"
    t.text "meas_log6"
    t.string "job_title_1"
    t.string "job_title_2"
    t.string "job_title_3"
    t.string "job_title_4"
    t.string "job_title_5"
    t.string "job_title_6"
    t.string "author"
    t.integer "kind"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mat_item1"
    t.string "mat_item2"
    t.string "mat_item3"
    t.string "mat_item4"
    t.string "mat_item5"
    t.string "mat_item6"
    t.index ["dreport_id"], name: "index_tickets_on_dreport_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.integer "number"
    t.string "brand"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "claims", "teams"
  add_foreign_key "materials", "claims"
  add_foreign_key "measures", "claims"
  add_foreign_key "teams", "trucks"
  add_foreign_key "tickets", "dreports"
end
