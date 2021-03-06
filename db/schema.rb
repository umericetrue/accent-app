# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_15_025102) do

  create_table "accents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "word", null: false
    t.string "word_kana", null: false
    t.integer "part_of_speech_id", null: false
    t.integer "accent_pattern_id", null: false
    t.integer "beat_count_id"
    t.text "info", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accents_on_user_id"
  end

  create_table "atamadakas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "accent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accent_id"], name: "index_atamadakas_on_accent_id"
    t.index ["user_id"], name: "index_atamadakas_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "user_id"
    t.bigint "accent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accent_id"], name: "index_comments_on_accent_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "heibans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "accent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accent_id"], name: "index_heibans_on_accent_id"
    t.index ["user_id"], name: "index_heibans_on_user_id"
  end

  create_table "nakadakas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "accent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accent_id"], name: "index_nakadakas_on_accent_id"
    t.index ["user_id"], name: "index_nakadakas_on_user_id"
  end

  create_table "odakas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "accent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accent_id"], name: "index_odakas_on_accent_id"
    t.index ["user_id"], name: "index_odakas_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accents", "users"
  add_foreign_key "atamadakas", "accents"
  add_foreign_key "atamadakas", "users"
  add_foreign_key "comments", "accents"
  add_foreign_key "comments", "users"
  add_foreign_key "heibans", "accents"
  add_foreign_key "heibans", "users"
  add_foreign_key "nakadakas", "accents"
  add_foreign_key "nakadakas", "users"
  add_foreign_key "odakas", "accents"
  add_foreign_key "odakas", "users"
end
