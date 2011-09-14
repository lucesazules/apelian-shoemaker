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

ActiveRecord::Schema.define(:version => 20110914150852) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors_shoes", :force => true do |t|
    t.integer "color_id"
    t.integer "shoe_id"
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "shoe_id"
    t.integer  "size_id"
    t.integer  "color_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details_sizes", :force => true do |t|
    t.integer "order_detail_id"
    t.integer "size_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "razon_social"
    t.string   "cuit"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "email_confirm"
    t.string   "telefono"
    t.string   "celular"
    t.string   "calle"
    t.string   "nro"
    t.string   "piso"
    t.string   "depto"
    t.string   "provincia"
    t.string   "localidad"
    t.string   "codigo_postal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoes", :force => true do |t|
    t.integer  "article_number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "heel"
    t.string   "season_name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_manual_thumb_file_name"
    t.string   "photo_manual_thumb_content_type"
    t.integer  "photo_manual_thumb_file_size"
    t.datetime "photo_manual_thumb_updated_at"
    t.integer  "year"
    t.boolean  "trend"
  end

  add_index "shoes", ["id"], :name => "index_shoes_on_id"
  add_index "shoes", ["name"], :name => "index_shoes_on_name"

  create_table "shoes_sizes", :force => true do |t|
    t.integer "shoe_id"
    t.integer "size_id"
  end

  create_table "sizes", :force => true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
