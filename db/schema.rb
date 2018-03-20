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

ActiveRecord::Schema.define(version: 20180319173331) do

  create_table "card_colors", force: :cascade do |t|
    t.integer "card_id"
    t.integer "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_formats", force: :cascade do |t|
    t.integer "card_id"
    t.integer "format_id"
    t.boolean "legal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "mana_cost"
    t.integer "cmc"
    t.string "full_type"
    t.string "rarity"
    t.string "text"
    t.string "flavor"
    t.string "artist"
    t.integer "collector_number"
    t.integer "power"
    t.integer "toughness"
    t.integer "loyalty"
    t.string "img_url"
    t.integer "mtg_set_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deck_cards", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "card_id"
    t.integer "card_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.integer "card_count"
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mtg_sets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.date "release_date"
    t.string "block"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
