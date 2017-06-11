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

ActiveRecord::Schema.define(version: 20170611023954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "girl_expertises", force: :cascade do |t|
    t.bigint "girl_id"
    t.bigint "expertise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expertise_id"], name: "index_girl_expertises_on_expertise_id"
    t.index ["girl_id"], name: "index_girl_expertises_on_girl_id"
  end

  create_table "girl_volunteers", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.bigint "girl_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["girl_id"], name: "index_girl_volunteers_on_girl_id"
    t.index ["volunteer_id"], name: "index_girl_volunteers_on_volunteer_id"
  end

  create_table "girls", force: :cascade do |t|
    t.string "username"
    t.string "language"
    t.string "password_digest"
    t.integer "age"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "girl_id"
    t.bigint "volunteer_id"
    t.string "message"
    t.boolean "volunteer_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["girl_id"], name: "index_messages_on_girl_id"
    t.index ["volunteer_id"], name: "index_messages_on_volunteer_id"
  end

  create_table "volunteer_expertises", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.bigint "expertise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expertise_id"], name: "index_volunteer_expertises_on_expertise_id"
    t.index ["volunteer_id"], name: "index_volunteer_expertises_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "username"
    t.string "language"
    t.string "certification_file_name"
    t.string "certification_content_type"
    t.integer "certification_file_size"
    t.datetime "certification_updated_at"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "girl_expertises", "expertises"
  add_foreign_key "girl_expertises", "girls"
  add_foreign_key "girl_volunteers", "girls"
  add_foreign_key "girl_volunteers", "volunteers"
  add_foreign_key "messages", "girls"
  add_foreign_key "messages", "volunteers"
  add_foreign_key "volunteer_expertises", "expertises"
  add_foreign_key "volunteer_expertises", "volunteers"
end
