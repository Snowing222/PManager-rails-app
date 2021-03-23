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

ActiveRecord::Schema.define(version: 2020_11_10_123715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "season"
    t.string "style_number"
    t.string "image_url"
    t.text "description"
    t.integer "product_status"
    t.date "deadline"
    t.integer "production_partner_id"
    t.integer "design_partner_id"
    t.integer "manufacture_partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "factory_id"
    t.index ["design_partner_id"], name: "index_products_on_design_partner_id"
    t.index ["manufacture_partner_id"], name: "index_products_on_manufacture_partner_id"
    t.index ["product_status"], name: "index_products_on_product_status"
    t.index ["production_partner_id"], name: "index_products_on_production_partner_id"
  end

  create_table "samples", force: :cascade do |t|
    t.text "comment"
    t.integer "sample_type"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_samples_on_product_id"
    t.index ["sample_type"], name: "index_samples_on_sample_type"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "current_state"
    t.integer "owner_id"
    t.date "deadline"
    t.integer "sample_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["current_state"], name: "index_statuses_on_current_state"
    t.index ["sample_id"], name: "index_statuses_on_sample_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.integer "role"
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
