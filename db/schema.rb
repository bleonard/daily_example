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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120110044040) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"
  add_index "delayed_jobs", ["report_id"], :name => "index_delayed_jobs_on_report_id"

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.integer  "table_id"
    t.integer  "user_id"
    t.string   "formatter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "generate_started_at"
    t.datetime "generate_ended_at"
    t.string   "transform"
    t.text     "transform_data"
    t.text     "formatter_data"
  end

  create_table "tables", :force => true do |t|
    t.integer  "user_id"
    t.text     "data"
    t.string   "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "guid"
    t.integer  "fetch_time_in_seconds"
    t.text     "column_names"
    t.string   "transform"
    t.text     "transform_data"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end