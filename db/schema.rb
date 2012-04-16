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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120413004841) do

  create_table "compartments_items", :force => true do |t|
    t.decimal  "capacity",                        :precision => 10, :scale => 0
    t.decimal  "quantity_limit",                  :precision => 10, :scale => 0
    t.integer  "height"
    t.string   "compartment_type",                                                                :null => false
    t.string   "description",      :limit => 100
    t.string   "item_code",        :limit => 50,                                                  :null => false
    t.string   "operation",        :limit => 1,                                  :default => "I"
    t.text     "error"
    t.datetime "created_at",                                                                      :null => false
    t.datetime "updated_at",                                                                      :null => false
  end

  add_index "compartments_items", ["compartment_type"], :name => "index_compartments_items_on_compartment_type"
  add_index "compartments_items", ["item_code"], :name => "index_compartments_items_on_item_code"

  create_table "items", :force => true do |t|
    t.string   "code",        :limit => 50,                   :null => false
    t.string   "description", :limit => 100
    t.string   "error"
    t.string   "operation",   :limit => 1,   :default => "I"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "items", ["code"], :name => "index_items_on_code"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.decimal  "quantity_requested",                :precision => 10, :scale => 0
    t.string   "item_code",          :limit => 50
    t.string   "notes",              :limit => 100
    t.string   "order_name",         :limit => 20
    t.string   "order_type",         :limit => 20
    t.string   "sub_code_a",         :limit => 50
    t.string   "sub_code_b",         :limit => 50
    t.text     "error"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  add_index "order_items", ["item_code"], :name => "index_order_items_on_item_code"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["order_name"], :name => "index_order_items_on_order_name"

  create_table "orders", :force => true do |t|
    t.boolean  "suspended",                 :default => false
    t.string   "command",     :limit => 5,  :default => "P"
    t.string   "description", :limit => 50
    t.string   "name",        :limit => 20,                    :null => false
    t.string   "operation",   :limit => 1,  :default => "I"
    t.text     "error"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "orders", ["name"], :name => "index_orders_on_name"
  add_index "orders", ["operation"], :name => "index_orders_on_operation"

  create_table "rails_admin_histories", :force => true do |t|
    t.integer  "item"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.string   "table"
    t.string   "username"
    t.text     "message"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.boolean  "admin",                  :default => false, :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
