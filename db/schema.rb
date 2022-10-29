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

ActiveRecord::Schema.define(version: 20221006005133) do

  create_table "client_appointment_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "product_id", null: false
    t.bigint "client_appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_appointment_id"], name: "index_client_appointment_products_on_client_appointment_id"
    t.index ["product_id"], name: "index_client_appointment_products_on_product_id"
  end

  create_table "client_appointments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "appointment_date"
    t.time "appointment_hour"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_appointments_on_client_id"
  end

  create_table "client_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "quotation_result_id"
    t.bigint "general_status_id"
    t.float "advance", limit: 24, default: 0.0
    t.string "stage"
    t.datetime "forecast_start_date"
    t.datetime "forecast_finish_date"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["general_status_id"], name: "index_client_projects_on_general_status_id"
    t.index ["quotation_result_id"], name: "index_client_projects_on_quotation_result_id"
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "names"
    t.string "ap_pat"
    t.string "ap_mat"
    t.string "tel"
    t.string "channel"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "calle"
    t.string "colonia"
    t.integer "numero"
    t.string "referencias"
    t.text "notas"
    t.index ["company_id"], name: "index_clients_on_company_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "RFC"
    t.string "adress", null: false
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "status", default: 0
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "description"
    t.float "unit_price", limit: 24, default: 0.0
    t.float "unit", limit: 24, default: 0.0
    t.bigint "company_id"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "quotation_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "client_appointment_products_id"
    t.bigint "general_status_id"
    t.string "file"
    t.float "quantity", limit: 24, default: 0.0
    t.float "subtotal", limit: 24, default: 0.0
    t.float "total", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_appointment_products_id"], name: "index_quotation_results_on_client_appointment_products_id"
    t.index ["general_status_id"], name: "index_quotation_results_on_general_status_id"
  end

  create_table "user_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "user_permissions", default: 3, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_appointment_products", "client_appointments", on_update: :cascade, on_delete: :cascade
  add_foreign_key "client_appointment_products", "products", on_update: :cascade, on_delete: :cascade
  add_foreign_key "client_appointments", "clients", on_update: :cascade, on_delete: :cascade
  add_foreign_key "client_projects", "general_statuses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "client_projects", "quotation_results", on_update: :cascade, on_delete: :cascade
  add_foreign_key "clients", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "products", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "quotation_results", "client_appointment_products", column: "client_appointment_products_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "quotation_results", "general_statuses", on_update: :cascade
  add_foreign_key "user_companies", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_companies", "users", on_update: :cascade, on_delete: :cascade
end
