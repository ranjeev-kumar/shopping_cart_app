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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160524131227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text     "address_1"
    t.text     "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "created_by_id"
    t.integer  "modified_by_id"
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "attribute_values", force: :cascade do |t|
    t.string   "value"
    t.boolean  "status",               default: false
    t.integer  "product_attribute_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "attribute_values", ["product_attribute_id"], name: "index_attribute_values_on_product_attribute_id", using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "quantity",   default: 0
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree
  add_index "cart_items", ["user_id"], name: "index_cart_items_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.integer  "category_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "status",      default: "false"
    t.string   "name"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "product_id",  null: false
  end

  add_index "categories_products", ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id", using: :btree
  add_index "categories_products", ["product_id", "category_id"], name: "index_categories_products_on_product_id_and_category_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.integer  "created_by_id"
    t.integer  "modified_by_id"
    t.boolean  "status",                                 default: false
    t.integer  "no_of_uses"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.decimal  "discount_of",    precision: 5, scale: 2
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "avatar"
    t.boolean  "main",       default: false
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "quantity",                               default: 0
    t.decimal  "amount",        precision: 12, scale: 2
    t.integer  "product_id"
    t.integer  "user_order_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "order_details", ["product_id"], name: "index_order_details_on_product_id", using: :btree
  add_index "order_details", ["user_order_id"], name: "index_order_details_on_user_order_id", using: :btree

  create_table "payment_gateways", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_order_id"
  end

  create_table "product_attribute_values", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "product_attribute_id"
    t.integer  "attribute_value_id"
    t.boolean  "status",               default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "product_attribute_values", ["attribute_value_id"], name: "index_product_attribute_values_on_attribute_value_id", using: :btree
  add_index "product_attribute_values", ["product_attribute_id"], name: "index_product_attribute_values_on_product_attribute_id", using: :btree
  add_index "product_attribute_values", ["product_id"], name: "index_product_attribute_values_on_product_id", using: :btree

  create_table "product_attributes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status",                              default: true
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.decimal  "price",       precision: 8, scale: 2
  end

  create_table "used_coupons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "used_coupons", ["coupon_id"], name: "index_used_coupons_on_coupon_id", using: :btree
  add_index "used_coupons", ["user_id"], name: "index_used_coupons_on_user_id", using: :btree

  create_table "user_orders", force: :cascade do |t|
    t.decimal  "total_amount",        precision: 12, scale: 2, default: 0.0
    t.decimal  "shipping_charge",     precision: 12, scale: 2, default: 0.0
    t.string   "status",                                       default: "Pending"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "user_id"
    t.integer  "payment_gateway_id"
    t.integer  "coupon_id"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "user_orders", ["coupon_id"], name: "index_user_orders_on_coupon_id", using: :btree
  add_index "user_orders", ["payment_gateway_id"], name: "index_user_orders_on_payment_gateway_id", using: :btree
  add_index "user_orders", ["user_id"], name: "index_user_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "newsletter",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wish_lists", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wish_lists", ["product_id"], name: "index_wish_lists_on_product_id", using: :btree
  add_index "wish_lists", ["user_id"], name: "index_wish_lists_on_user_id", using: :btree

  add_foreign_key "addresses", "users"
end
