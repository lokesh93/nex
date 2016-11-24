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

ActiveRecord::Schema.define(version: 20151130010903) do

  create_table "accepted_payment_methods", force: :cascade do |t|
    t.integer  "vendor_id",         limit: 4
    t.integer  "post_id",           limit: 4
    t.integer  "payment_method_id", limit: 4
    t.boolean  "preferred",         limit: 1, default: false
    t.boolean  "accepted",          limit: 1, default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.boolean  "read",           limit: 1,     default: false
    t.boolean  "collected",      limit: 1,     default: false
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "assets", force: :cascade do |t|
    t.integer  "owner_id",           limit: 4
    t.string   "owner_type",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "owner_id",           limit: 4
    t.string   "owner_type",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "embedded_id",        limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.boolean  "active",             limit: 1
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "value",      limit: 4
    t.string   "status",     limit: 255,   default: "bid-pending"
    t.text     "info",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.boolean  "legacy",     limit: 1,     default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "industry_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "consumers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id",    limit: 4
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "subject",       limit: 255
    t.date     "last_msg"
    t.boolean  "read_all_msgs", limit: 1,   default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_locations", force: :cascade do |t|
    t.integer  "vendor_id",  limit: 4
    t.integer  "city_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_notification_settings", force: :cascade do |t|
    t.string   "settings_for",  limit: 255
    t.integer  "timed_task_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "email_notification_settings", ["timed_task_id"], name: "index_email_notification_settings_on_timed_task_id", using: :btree
  add_index "email_notification_settings", ["user_id"], name: "index_email_notification_settings_on_user_id", using: :btree

  create_table "external_links", force: :cascade do |t|
    t.integer  "vendor_id",          limit: 4
    t.integer  "external_source_id", limit: 4
    t.string   "link",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_sources", force: :cascade do |t|
    t.string   "source_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "email",         limit: 255
    t.text     "content",       limit: 65535
    t.string   "fist_name",     limit: 255
    t.string   "last_name",     limit: 255
    t.string   "feedback_type", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "owner_id",   limit: 4
    t.string   "owner_type", limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_options", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "media", force: :cascade do |t|
    t.integer  "owner_id",   limit: 4
    t.string   "owner_type", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "conversation_id", limit: 4
    t.text     "info",            limit: 65535
    t.boolean  "read",            limit: 1,     default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "options_city_lists", force: :cascade do |t|
    t.integer  "location_option_id", limit: 4
    t.integer  "city_id",            limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "participant_lists", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "conversation_id", limit: 4
    t.boolean  "read",            limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "personal_infos", force: :cascade do |t|
    t.string   "legal_first_name", limit: 255
    t.string   "legal_last_name",  limit: 255
    t.string   "preferred_name",   limit: 255
    t.string   "email",            limit: 255
    t.string   "title",            limit: 255
    t.integer  "primary_phone",    limit: 4
    t.integer  "secondary_phone",  limit: 4
    t.integer  "vendor_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "physical_locations", force: :cascade do |t|
    t.string   "address",          limit: 255
    t.string   "postal_code",      limit: 255
    t.string   "business_phone",   limit: 255
    t.string   "other_phone",      limit: 255
    t.string   "fax",              limit: 255
    t.string   "business_email",   limit: 255
    t.string   "business_website", limit: 255
    t.boolean  "sale_location",    limit: 1
    t.integer  "city_id",          limit: 4
    t.integer  "vendor_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "owner_id",           limit: 4
    t.string   "owner_type",         limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "post_subscriptions", force: :cascade do |t|
    t.integer  "post_id",        limit: 4
    t.integer  "subcategory_id", limit: 4
    t.integer  "category_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.text     "description",         limit: 65535
    t.integer  "user_id",             limit: 4
    t.string   "status",              limit: 255,   default: "active"
    t.date     "due_date"
    t.boolean  "phone_contact",       limit: 1
    t.boolean  "email_contact",       limit: 1
    t.boolean  "delivery_needed",     limit: 1
    t.boolean  "service_needed",      limit: 1
    t.boolean  "pick_up_needed",      limit: 1
    t.string   "other_needed_string", limit: 255
    t.boolean  "other_needed",        limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",              limit: 1
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.string   "short_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "raiting",    limit: 4
    t.text     "feedback",   limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "vendor_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "service_locations", force: :cascade do |t|
    t.integer  "vendor_id",  limit: 4
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "tip",         limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timed_tasks", force: :cascade do |t|
    t.integer  "interval",        limit: 4
    t.string   "measure_of_time", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",          limit: 255
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "email",             limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.boolean  "admin",             limit: 1,   default: false
    t.integer  "account_id",        limit: 4
    t.string   "account_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_subscriptions", force: :cascade do |t|
    t.integer  "vendor_id",      limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "business_name",        limit: 255
    t.text     "business_description", limit: 65535
    t.date     "establish_date"
    t.integer  "tax_number",           limit: 4
    t.boolean  "shipping",             limit: 1
    t.boolean  "selling",              limit: 1
    t.boolean  "servicing",            limit: 1
    t.boolean  "verified",             limit: 1,     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "watched_posts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
