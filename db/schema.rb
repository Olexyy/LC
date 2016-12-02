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

ActiveRecord::Schema.define(version: 20161201140106) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 150,             null: false
    t.integer  "weight",                 default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "lawsuits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            limit: 150,             null: false
    t.integer  "weight",                      default: 0, null: false
    t.integer  "subcategory_id"
    t.integer  "web_resource_id",                         null: false
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

  create_table "web_resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 150,               null: false
    t.string   "title",      limit: 150
    t.text     "body",       limit: 65535,             null: false
    t.string   "key",        limit: 150,               null: false
    t.integer  "weight",                   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_foreign_key "lawsuits", "subcategories"
  add_foreign_key "lawsuits", "web_resources"
  add_foreign_key "subcategories", "categories"
end
