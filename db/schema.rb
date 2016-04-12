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

ActiveRecord::Schema.define(version: 20160411141742) do

  create_table "properties", force: :cascade do |t|
    t.string   "addressLine1"
    t.string   "addressLine2"
    t.string   "town"
    t.string   "country"
    t.string   "postcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "property_answers", force: :cascade do |t|
    t.integer  "property_question_id"
    t.integer  "user_id"
    t.text     "answerText"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "property_answers", ["property_question_id"], name: "index_property_answers_on_property_question_id"
  add_index "property_answers", ["user_id"], name: "index_property_answers_on_user_id"

  create_table "property_questions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.string   "questionTitle"
    t.text     "questionText"
    t.datetime "questionTime",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "property_questions", ["property_id"], name: "index_property_questions_on_property_id"
  add_index "property_questions", ["user_id"], name: "index_property_questions_on_user_id"

  create_table "review_comments", force: :cascade do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.text     "commentText"
    t.datetime "commentTimeStamp"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "review_comments", ["review_id"], name: "index_review_comments_on_review_id"
  add_index "review_comments", ["user_id"], name: "index_review_comments_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_property_period_id"
    t.text     "reviewText"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "reviews", ["user_property_period_id"], name: "index_reviews_on_user_property_period_id"

  create_table "user_property_periods", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_property_periods", ["property_id"], name: "index_user_property_periods_on_property_id"
  add_index "user_property_periods", ["user_id"], name: "index_user_property_periods_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
