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

ActiveRecord::Schema.define(version: 20161211144804) do

  create_table "block_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 150,             null: false
    t.string   "text",       limit: 150,             null: false
    t.integer  "weight",                 default: 0, null: false
    t.integer  "data_type",              default: 0, null: false
    t.string   "marker",     limit: 150,             null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "block_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 150,             null: false
    t.integer  "weight",                 default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "block_parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          limit: 150,               null: false
    t.text     "text",          limit: 65535,             null: false
    t.integer  "weight",                      default: 0, null: false
    t.integer  "text_style_id",                           null: false
    t.integer  "block_id",                                null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["block_id"], name: "index_block_parts_on_block_id", using: :btree
    t.index ["text_style_id"], name: "index_block_parts_on_text_style_id", using: :btree
  end

  create_table "blocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",           limit: 150,             null: false
    t.integer  "weight",                     default: 0, null: false
    t.integer  "include_type",               default: 0, null: false
    t.integer  "content_type",               default: 0, null: false
    t.integer  "block_field_id",             default: 0
    t.integer  "block_group_id",                         null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["block_field_id"], name: "index_blocks_on_block_field_id", using: :btree
    t.index ["block_group_id"], name: "index_blocks_on_block_group_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 150,             null: false
    t.integer  "weight",                 default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "lawsuit_blocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "weight",     default: 0, null: false
    t.integer  "lawsuit_id",             null: false
    t.integer  "block_id",               null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["block_id"], name: "index_lawsuit_blocks_on_block_id", using: :btree
    t.index ["lawsuit_id"], name: "index_lawsuit_blocks_on_lawsuit_id", using: :btree
  end

  create_table "lawsuits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            limit: 150,             null: false
    t.integer  "weight",                      default: 0, null: false
    t.integer  "subcategory_id",                          null: false
    t.integer  "web_resource_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["subcategory_id"], name: "index_lawsuits_on_subcategory_id", using: :btree
    t.index ["web_resource_id"], name: "index_lawsuits_on_web_resource_id", using: :btree
  end

  create_table "subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 150,             null: false
    t.integer  "category_id"
    t.integer  "weight",                  default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  create_table "text_styles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 150,                 null: false
    t.integer  "weight",                  default: 0,     null: false
    t.integer  "tag",                     default: 0,     null: false
    t.integer  "margin_left",             default: 0,     null: false
    t.integer  "text_align",              default: 0,     null: false
    t.boolean  "strong",                  default: false, null: false
    t.boolean  "underline",               default: false, null: false
    t.boolean  "italic",                  default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "web_resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 150,               null: false
    t.string   "title",      limit: 150
    t.text     "body",       limit: 65535,             null: false
    t.string   "key",        limit: 150,               null: false
    t.integer  "weight",                   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_foreign_key "block_parts", "blocks"
  add_foreign_key "block_parts", "text_styles"
  add_foreign_key "blocks", "block_fields"
  add_foreign_key "blocks", "block_groups"
  add_foreign_key "lawsuit_blocks", "blocks"
  add_foreign_key "lawsuit_blocks", "lawsuits"
  add_foreign_key "lawsuits", "subcategories"
  add_foreign_key "lawsuits", "web_resources"
  add_foreign_key "subcategories", "categories"
end
