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

ActiveRecord::Schema.define(version: 2020_09_13_183915) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_routines", force: :cascade do |t|
    t.integer "user_id"
    t.text "daily_plan"
    t.string "prayer_or_meditations"
    t.text "exercise_plan"
    t.text "stretch_plan"
    t.text "three_superfoods_to_add_to_my_meals"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journals", force: :cascade do |t|
    t.date "date"
    t.integer "focus"
    t.integer "organization"
    t.integer "impulse_control"
    t.integer "worry"
    t.integer "mood"
    t.integer "temper_control"
    t.integer "memory"
    t.integer "anxiety"
    t.integer "sleep"
    t.integer "other"
    t.text "notes"
    t.text "reminders"
    t.text "three_things_i_am_grateful_for"
    t.text "negative_thoughts"
    t.text "challenges"
    t.string "breakfast"
    t.string "snack_one"
    t.string "lunch"
    t.string "snack_two"
    t.string "dinner"
    t.boolean "healthy"
    t.text "how_did_i_feel_after"
    t.time "time_eaten"
    t.string "brain_health"
    t.string "physical_health"
    t.string "emotional_health"
    t.string "thinking_patterns"
    t.string "spouse"
    t.string "children"
    t.string "family_and_friends"
    t.string "work"
    t.string "school"
    t.string "money"
    t.string "spiritual_life"
    t.string "character"
    t.string "passions"
    t.string "community_service"
    t.string "giving_to_charity"
    t.string "word_of_day"
    t.string "bible_verse_of_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id"
    t.string "task_name"
    t.text "action_one"
    t.text "action_two"
    t.text "action_three"
    t.date "deadline"
    t.time "estimate_time_to_finish_task"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "priority_ranking"
    t.date "date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
