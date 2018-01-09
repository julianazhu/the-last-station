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

ActiveRecord::Schema.define(version: 20160123065821) do

  create_table "branch_requirements", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "quality_id"
    t.string   "operation"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_requirements", ["branch_id"], name: "index_branch_requirements_on_branch_id"
  add_index "branch_requirements", ["quality_id"], name: "index_branch_requirements_on_quality_id"

  create_table "branches", force: :cascade do |t|
    t.integer  "story_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "outcome"
    t.string   "image_path"
  end

  add_index "branches", ["story_id"], name: "index_branches_on_story_id"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_image_path"
    t.string   "gender"
  end

  create_table "decks", force: :cascade do |t|
    t.integer  "character_id"
    t.text     "cards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["character_id"], name: "index_decks_on_character_id"

  create_table "effects", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "quality_id"
    t.string   "operation"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "effects", ["branch_id"], name: "index_effects_on_branch_id"
  add_index "effects", ["quality_id"], name: "index_effects_on_quality_id"

  create_table "fate_cards", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: :cascade do |t|
    t.integer  "quality_id"
    t.integer  "rank"
    t.string   "description"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "minimum_points"
    t.text     "flavor_text"
  end

  create_table "qualities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image_path"
    t.integer  "points"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.boolean  "ranked"
  end

  add_index "qualities", ["character_id"], name: "index_qualities_on_character_id"

  create_table "requirements", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "quality_id"
    t.string   "operation"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requirements", ["quality_id"], name: "index_requirements_on_quality_id"
  add_index "requirements", ["story_id"], name: "index_requirements_on_story_id"

  create_table "stats", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "quality_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["character_id"], name: "index_stats_on_character_id"
  add_index "stats", ["quality_id"], name: "index_stats_on_quality_id"

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "hook"
    t.string   "location"
  end

end
