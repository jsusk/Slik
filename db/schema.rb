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

ActiveRecord::Schema.define(:version => 20120801180258) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "fecha"
  end

  create_table "d_combos", :force => true do |t|
    t.integer  "e_combo_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cantidad"
  end

  add_index "d_combos", ["e_combo_id"], :name => "index_d_combos_on_e_combo_id"
  add_index "d_combos", ["product_id"], :name => "index_d_combos_on_product_id"

  create_table "d_sales", :force => true do |t|
    t.integer  "cantidad"
    t.integer  "product_id"
    t.integer  "e_combo_id"
    t.integer  "cart_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "e_sale_id"
  end

  add_index "d_sales", ["cart_id"], :name => "index_d_sales_on_cart_id"
  add_index "d_sales", ["e_combo_id"], :name => "index_d_sales_on_e_combo_id"
  add_index "d_sales", ["e_sale_id"], :name => "index_d_sales_on_e_sale_id"
  add_index "d_sales", ["product_id"], :name => "index_d_sales_on_product_id"

  create_table "d_suppliers", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "product_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "d_suppliers", ["product_id"], :name => "index_d_suppliers_on_product_id"
  add_index "d_suppliers", ["supplier_id"], :name => "index_d_suppliers_on_supplier_id"

  create_table "e_combos", :force => true do |t|
    t.string   "nombre"
    t.float    "precio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "e_sales", :force => true do |t|
    t.date     "fecha"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "precio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "rfc"
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
