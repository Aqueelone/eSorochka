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

ActiveRecord::Schema.define(version: 20160412050445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachement"
    t.string   "image_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name_ua"
    t.string   "name_ru"
    t.string   "name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "color_gid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: true do |t|
    t.integer  "user_id"
    t.integer  "messenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "dashboards", ["messenger_id"], name: "index_dashboards_on_messenger_id", using: :btree
  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id", using: :btree

  create_table "fabrics", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "composition"
    t.string   "attachement"
    t.string   "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id"
    t.integer  "fabric_id"
    t.integer  "product_id"
  end

  add_index "galleries", ["color_id"], name: "index_galleries_on_color_id", using: :btree
  add_index "galleries", ["fabric_id"], name: "index_galleries_on_fabric_id", using: :btree
  add_index "galleries", ["product_id"], name: "index_galleries_on_product_id", using: :btree

  create_table "galleries_images", id: false, force: true do |t|
    t.integer "gallery_id"
    t.integer "image_id"
  end

  add_index "galleries_images", ["gallery_id"], name: "index_galleries_images_on_gallery_id", using: :btree
  add_index "galleries_images", ["image_id"], name: "index_galleries_images_on_image_id", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "image_galleries", id: false, force: true do |t|
    t.integer "image_id"
    t.integer "gallery_id"
  end

  add_index "image_galleries", ["gallery_id"], name: "index_image_galleries_on_gallery_id", using: :btree
  add_index "image_galleries", ["image_id"], name: "index_image_galleries_on_image_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "description"
    t.string   "attachement"
    t.string   "file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id"
  end

  add_index "images", ["gallery_id"], name: "index_images_on_gallery_id", using: :btree

  create_table "messengers", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: true do |t|
    t.integer  "amount",          default: 1
    t.integer  "product_code_id"
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "temporary"
    t.integer  "last_order_id"
  end

  create_table "order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cell"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "stuff_id"
    t.uuid     "temporary"
    t.boolean  "closed",          default: false
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_type_id"
    t.integer  "order_status_id"
  end

  create_table "payment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_codes", force: true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.integer  "category_id"
    t.integer  "color_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "show"
    t.integer  "amount_min"
    t.integer  "amount_max"
    t.integer  "price_min"
    t.integer  "price_max"
    t.string   "cut_type"
    t.string   "collar_type"
    t.string   "sleeve_type"
    t.string   "cuff_type"
    t.string   "style_type"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_sizes", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "size_id"
  end

  add_index "products_sizes", ["product_id"], name: "index_products_sizes_on_product_id", using: :btree
  add_index "products_sizes", ["size_id"], name: "index_products_sizes_on_size_id", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.string   "sign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_moderator",           default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.uuid     "temporary"
    t.string   "cell"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dashboards", "users", name: "dashboards_user_id_fk"

  add_foreign_key "identities", "users", name: "identities_user_id_fk"

end
