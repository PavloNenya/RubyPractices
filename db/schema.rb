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

ActiveRecord::Schema[7.1].define(version: 2024_05_13_141827) do
  create_table "business_models", force: :cascade do |t|
    t.string "name"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chose_ps", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "user_id", null: false
    t.string "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_chose_ps_on_service_id"
    t.index ["user_id"], name: "index_chose_ps_on_user_id"
  end

  create_table "chose_us", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "user_id", null: false
    t.string "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_chose_us_on_service_id"
    t.index ["user_id"], name: "index_chose_us_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "poster_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_id"], name: "index_favorites_on_poster_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "poster_id", null: false
    t.integer "user_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_id"], name: "index_payments_on_poster_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "posters", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.integer "service_id", null: false
    t.decimal "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_posters_on_service_id"
    t.index ["user_id"], name: "index_posters_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "surname"
    t.string "fatherly"
    t.date "date_of_birth"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "currency"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "poster_id", null: false
    t.integer "user_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_id"], name: "index_reviews_on_poster_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chose_ps", "services"
  add_foreign_key "chose_ps", "users"
  add_foreign_key "chose_us", "services"
  add_foreign_key "chose_us", "users"
  add_foreign_key "favorites", "posters"
  add_foreign_key "favorites", "users"
  add_foreign_key "payments", "posters"
  add_foreign_key "payments", "users"
  add_foreign_key "posters", "services"
  add_foreign_key "posters", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "posters"
  add_foreign_key "reviews", "users"
end
