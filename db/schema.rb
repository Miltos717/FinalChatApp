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

ActiveRecord::Schema[7.0].define(version: 2023_03_05_182858) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followability_relationships", force: :cascade do |t|
    t.string "followerable_type", null: false
    t.bigint "followerable_id", null: false
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_type", "followable_id"], name: "index_followability_relationships_on_followable"
    t.index ["followerable_type", "followerable_id"], name: "index_followability_relationships_on_followerable"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.string "create"
    t.string "destroy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "followed_id"
    t.integer "follower_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_chatrooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_user_chatrooms_on_chatroom_id"
    t.index ["user_id"], name: "index_user_chatrooms_on_user_id"
  end

  create_table "user_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "followed_user_id"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "followed_id", null: false
    t.index ["followed_id"], name: "index_user_relationships_on_followed_id"
    t.index ["followed_user_id"], name: "index_user_relationships_on_followed_user_id"
    t.index ["user_id", "followed_user_id"], name: "index_user_relationships_on_user_id_and_followed_user_id", unique: true
    t.index ["user_id"], name: "index_user_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_chatrooms", "chatrooms"
  add_foreign_key "user_chatrooms", "users"
  add_foreign_key "user_relationships", "users", column: "followed_id"
end
