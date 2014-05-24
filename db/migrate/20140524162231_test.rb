class Test < ActiveRecord::Migration
  def change
   def self.up
   
   create_table "runs", force: true do |t|
    t.string   "testcase_name"
    t.string   "testcase_module"
    t.string   "release"
    t.string   "project"
    t.string   "browser"
    t.string   "testcase_status"
    t.string   "testcase_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cycle"
  end

  
  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unsubscribe_key"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
end
end
end
