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

ActiveRecord::Schema.define(version: 2018_09_06_145417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bosses", force: :cascade do |t|
    t.string "name"
    t.string "zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patch"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "realm"
    t.integer "ilvl"
    t.string "class_name"
    t.string "portrait"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.bigint "boss_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boss_id"], name: "index_npcs_on_boss_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "ilvl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["character_id"], name: "index_ranks_on_character_id"
  end

  create_table "youtubes", force: :cascade do |t|
    t.string "link"
    t.bigint "character_id"
    t.bigint "boss_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boss_id"], name: "index_youtubes_on_boss_id"
    t.index ["character_id"], name: "index_youtubes_on_character_id"
  end

  add_foreign_key "npcs", "bosses"
end
