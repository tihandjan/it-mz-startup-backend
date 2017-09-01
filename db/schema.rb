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

ActiveRecord::Schema.define(version: 20170828191336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "recipes_count",          default: 0
    t.string   "surname"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
    t.index ["user_id", "user_type"], name: "index_comments_on_user_id_and_user_type", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_countries_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "calories",      default: 0
    t.integer  "fats",          default: 0
    t.integer  "proteins",      default: 0
    t.integer  "carbohydrates", default: 0
    t.string   "image"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "image"
    t.integer  "time"
    t.integer  "porsion"
    t.string   "complexity"
    t.string   "slug"
    t.integer  "calories",        default: 0
    t.integer  "proteins",        default: 0
    t.integer  "fats",            default: 0
    t.integer  "carbohydrates",   default: 0
    t.datetime "publish"
    t.integer  "rating",          default: 0
    t.integer  "user_id"
    t.boolean  "approved",        default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "admin_id"
    t.string   "user_type",       default: "user"
    t.integer  "country_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.index ["admin_id"], name: "index_recipes_on_admin_id", using: :btree
    t.index ["category_id"], name: "index_recipes_on_category_id", using: :btree
    t.index ["country_id"], name: "index_recipes_on_country_id", using: :btree
    t.index ["slug"], name: "index_recipes_on_slug", unique: true, using: :btree
    t.index ["sub_category_id"], name: "index_recipes_on_sub_category_id", using: :btree
    t.index ["user_id"], name: "index_recipes_on_user_id", using: :btree
  end

  create_table "recipes_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "amount"
    t.string   "unit",          default: "gramm"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["ingredient_id"], name: "index_recipes_ingredients_on_ingredient_id", using: :btree
    t.index ["recipe_id"], name: "index_recipes_ingredients_on_recipe_id", using: :btree
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "step"
    t.string   "image"
    t.text     "content"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
    t.index ["slug"], name: "index_sub_categories_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "recipes_count",          default: 0
    t.string   "surname"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["votable_type", "votable_id", "user_id"], name: "index_votes_on_votable_type_and_votable_id_and_user_id", unique: true, using: :btree
  end

  add_foreign_key "recipes", "admins"
  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "countries"
  add_foreign_key "recipes", "sub_categories"
  add_foreign_key "recipes", "users"
  add_foreign_key "recipes_ingredients", "ingredients"
  add_foreign_key "recipes_ingredients", "recipes"
  add_foreign_key "steps", "recipes"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "votes", "users"
end
