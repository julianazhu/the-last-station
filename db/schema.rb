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

ActiveRecord::Schema.define(version: 20151105065349) do

  create_table "branches", force: true do |t|
    t.string   "story_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "outcome"
  end

  add_index "branches", ["story_id"], name: "index_branches_on_story_id"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_image_path"
    t.string   "gender"
  end

  create_table "effects", force: true do |t|
    t.string   "branch_id"
    t.string   "quality_id"
    t.string   "operation"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "effects", ["branch_id"], name: "index_effects_on_branch_id"
  add_index "effects", ["quality_id"], name: "index_effects_on_quality_id"

  create_table "levels", force: true do |t|
    t.integer  "quality_id"
    t.integer  "amount"
    t.string   "description"
    t.string   "image_path"
    t.boolean  "triangular"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image_path"
    t.integer  "points"
    t.string   "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "qualities", ["character_id"], name: "index_qualities_on_character_id"

  create_table "requirements", force: true do |t|
    t.string   "story_id"
    t.string   "quality_id"
    t.string   "operation"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requirements", ["quality_id"], name: "index_requirements_on_quality_id"
  add_index "requirements", ["story_id"], name: "index_requirements_on_story_id"

  create_table "stats", force: true do |t|
    t.string   "character_id"
    t.string   "quality_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["character_id"], name: "index_stats_on_character_id"
  add_index "stats", ["quality_id"], name: "index_stats_on_quality_id"

  create_table "stories", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
