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

ActiveRecord::Schema.define(version: 20151027070906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "abilities", ["name"], name: "index_abilities_on_name", unique: true, using: :btree

  create_table "attribute_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attribute_categories", ["name"], name: "index_attribute_categories_on_name", unique: true, using: :btree

  create_table "caste_abilities", force: :cascade do |t|
    t.integer "caste_id",   null: false
    t.integer "ability_id", null: false
  end

  add_index "caste_abilities", ["ability_id"], name: "index_caste_abilities_on_ability_id", using: :btree
  add_index "caste_abilities", ["caste_id", "ability_id"], name: "index_caste_abilities_on_caste_id_and_ability_id", unique: true, using: :btree
  add_index "caste_abilities", ["caste_id"], name: "index_caste_abilities_on_caste_id", using: :btree

  create_table "castes", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "anima_effect",      null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "character_type_id", null: false
  end

  add_index "castes", ["name"], name: "index_castes_on_name", unique: true, using: :btree

  create_table "character_attributes", force: :cascade do |t|
    t.integer  "attribute_category_id", null: false
    t.string   "name",                  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "character_attributes", ["attribute_category_id"], name: "index_character_attributes_on_attribute_category_id", using: :btree
  add_index "character_attributes", ["name"], name: "index_character_attributes_on_name", unique: true, using: :btree

  create_table "character_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "character_types", ["name"], name: "index_character_types_on_name", unique: true, using: :btree

  add_foreign_key "caste_abilities", "abilities"
  add_foreign_key "caste_abilities", "castes"
  add_foreign_key "castes", "character_types"
  add_foreign_key "character_attributes", "attribute_categories"
end
