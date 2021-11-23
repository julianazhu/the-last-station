# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_22_083052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "branch_requirements", force: :cascade do |t|
    t.integer "branch_id"
    t.integer "quality_id"
    t.text "operation"
    t.integer "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["branch_id"], name: "index_branch_requirements_on_branch_id"
    t.index ["quality_id"], name: "index_branch_requirements_on_quality_id"
  end

  create_table "branches", force: :cascade do |t|
    t.integer "story_id"
    t.text "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "outcome"
    t.text "image_path"
    t.index ["story_id"], name: "index_branches_on_story_id"
  end

  create_table "characters", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "avatar_image_path"
    t.text "gender"
  end

  create_table "decks", force: :cascade do |t|
    t.integer "character_id"
    t.text "cards"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["character_id"], name: "index_decks_on_character_id"
  end

  create_table "effects", force: :cascade do |t|
    t.integer "branch_id"
    t.integer "quality_id"
    t.text "operation"
    t.integer "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["branch_id"], name: "index_effects_on_branch_id"
    t.index ["quality_id"], name: "index_effects_on_quality_id"
  end

  create_table "fate_cards", force: :cascade do |t|
    t.integer "character_id"
    t.integer "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "quality_id"
    t.integer "rank"
    t.text "description"
    t.text "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "minimum_points"
    t.text "flavor_text"
  end

  create_table "qualities", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "image_path"
    t.integer "points"
    t.integer "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "category"
    t.boolean "ranked"
    t.index ["character_id"], name: "index_qualities_on_character_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.integer "story_id"
    t.integer "quality_id"
    t.text "operation"
    t.integer "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["quality_id"], name: "index_requirements_on_quality_id"
    t.index ["story_id"], name: "index_requirements_on_story_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "character_id"
    t.integer "quality_id"
    t.integer "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["character_id"], name: "index_stats_on_character_id"
    t.index ["quality_id"], name: "index_stats_on_quality_id"
  end

  create_table "stories", force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.text "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "hook"
    t.text "location"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
