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

ActiveRecord::Schema.define(:version => 20130515103244) do

  create_table "glysellin_addresses", :force => true do |t|
    t.boolean  "activated",                :default => true
    t.boolean  "company"
    t.string   "company_name"
    t.string   "vat_number"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.text     "address_details"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "tel"
    t.string   "fax"
    t.text     "additional_fields"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "shipped_addressable_type"
    t.integer  "shipped_addressable_id"
    t.string   "billed_addressable_type"
    t.integer  "billed_addressable_id"
  end

  create_table "glysellin_brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "glysellin_customers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "glysellin_discount_codes", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "discount_type_id"
    t.decimal  "value",            :precision => 11, :scale => 2
    t.datetime "expires_on"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "glysellin_discount_codes", ["code"], :name => "index_glysellin_discount_codes_on_code"

  create_table "glysellin_discount_types", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "glysellin_order_adjustments", :force => true do |t|
    t.string   "name"
    t.decimal  "value",           :precision => 11, :scale => 2
    t.integer  "order_id"
    t.integer  "adjustment_id"
    t.string   "adjustment_type"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "glysellin_order_items", :force => true do |t|
    t.string   "sku"
    t.string   "name"
    t.decimal  "eot_price",  :precision => 11, :scale => 2
    t.decimal  "price",      :precision => 11, :scale => 2
    t.decimal  "vat_rate",   :precision => 11, :scale => 2
    t.integer  "quantity"
    t.integer  "order_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "weight",     :precision => 11, :scale => 3
  end

  create_table "glysellin_orders", :force => true do |t|
    t.string   "ref"
    t.string   "status"
    t.datetime "paid_on"
    t.integer  "user_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.string   "state"
    t.integer  "customer_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "shipping_method_id"
  end

  create_table "glysellin_payment_methods", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "glysellin_payments", :force => true do |t|
    t.string   "status"
    t.integer  "type_id"
    t.integer  "order_id"
    t.datetime "last_payment_action_on"
    t.integer  "transaction_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "glysellin_product_images", :force => true do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "glysellin_product_properties", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.decimal  "adjustement",  :precision => 11, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "type_id"
    t.integer  "variant_id"
    t.string   "variant_type"
  end

  create_table "glysellin_product_property_types", :force => true do |t|
    t.string "name"
  end

  create_table "glysellin_product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "glysellin_product_types_properties", :id => false, :force => true do |t|
    t.integer "product_type_id"
    t.integer "product_property_id"
  end

  create_table "glysellin_products", :force => true do |t|
    t.string   "sku"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.decimal  "vat_rate",        :precision => 11, :scale => 2
    t.integer  "position",                                       :default => 1
    t.boolean  "published",                                      :default => true
    t.integer  "brand_id"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "product_type_id"
  end

  create_table "glysellin_products_taxonomies", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "taxonomy_id"
  end

  create_table "glysellin_shipping_methods", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "glysellin_shipping_methods", ["identifier"], :name => "index_glysellin_shipping_methods_on_identifier"

  create_table "glysellin_taxonomies", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "parent_taxonomy_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "glysellin_variants", :force => true do |t|
    t.string   "sku"
    t.string   "name"
    t.string   "slug"
    t.decimal  "eot_price",       :precision => 11, :scale => 2
    t.decimal  "price",           :precision => 11, :scale => 2
    t.integer  "in_stock",                                       :default => 0
    t.boolean  "unlimited_stock",                                :default => false
    t.boolean  "published",                                      :default => true
    t.integer  "position"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.integer  "product_id"
    t.decimal  "weight"
    t.decimal  "unmarked_price",  :precision => 11, :scale => 2
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "restful_sync_api_clients", :force => true do |t|
    t.string   "authentication_token"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "restful_sync_api_clients", ["authentication_token"], :name => "index_restful_sync_api_clients_on_authentication_token", :unique => true

  create_table "restful_sync_api_targets", :force => true do |t|
    t.string   "end_point"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restful_sync_sync_refs", :force => true do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "uuid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
