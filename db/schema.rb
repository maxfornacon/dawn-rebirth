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

ActiveRecord::Schema.define(version: 20161015204940) do

  create_table "animes", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flags", force: :cascade do |t|
    t.integer  "pin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guilds", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "score"
    t.string   "guildtype"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_guilds_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "guild_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body_html"
    t.index ["guild_id"], name: "index_messages_on_guild_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pins", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_pins_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_pins_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_pins_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_pins_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_pins_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_pins_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_pins_on_cached_weighted_total"
    t.index ["user_id"], name: "index_pins_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
    t.datetime "date_of_birth"
    t.boolean  "is_female",              default: false
    t.boolean  "owner",                  default: false
    t.boolean  "guildmember",            default: false
    t.integer  "guild_id",               default: 0
    t.text     "status"
    t.string   "favanime"
    t.string   "favmanga"
    t.text     "bio"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "askfm"
    t.string   "snapchat"
    t.string   "googleplus"
    t.boolean  "admin",                  default: false
    t.integer  "score",                  default: 0
    t.integer  "guildrank",              default: 0
    t.boolean  "online",                 default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
