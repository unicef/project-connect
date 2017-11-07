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

ActiveRecord::Schema.define(version: 20171107012124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.string "address"
    t.string "admin0"
    t.string "admin1"
    t.string "admin2"
    t.string "admin3"
    t.string "admin4"
    t.string "admin_code"
    t.string "admin_id"
    t.string "altitude"
    t.float "availability_connectivity"
    t.boolean "connectivity"
    t.string "country_code"
    t.string "datasource"
    t.integer "datasource_version_number"
    t.text "description"
    t.string "educ_level"
    t.boolean "electricity"
    t.string "environment"
    t.string "frequency"
    t.float "latency_connectivity"
    t.float "lat"
    t.float "lon"
    t.string "name"
    t.integer "num_classrooms"
    t.integer "num_latrines"
    t.integer "num_teachers"
    t.integer "num_students"
    t.integer "num_sections"
    t.string "phone_number"
    t.string "postal_code"
    t.float "speed_connectivity"
    t.string "type_connectivity"
    t.string "type_school"
    t.boolean "water"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address2"
    t.string "person_contact"
    t.string "email"
    t.float "geoloc_confidence"
    t.float "tower_dist"
    t.string "tower_type_service"
    t.string "tower_type"
    t.string "tower_code"
    t.float "tower_latitude"
    t.float "tower_longitude"
    t.string "owner"
    t.string "provider"
    t.boolean "is_private"
    t.boolean "provider_is_private"
    t.string "creator_email"
    t.boolean "coords_within_country"
    t.datetime "date_geo_validated"
    t.string "id_0"
    t.string "id_1"
    t.string "id_2"
    t.string "id_3"
    t.string "id_4"
    t.string "id_5"
    t.boolean "hasProbeData"
    t.index ["address"], name: "index_schools_on_address"
    t.index ["address2"], name: "index_schools_on_address2"
    t.index ["admin0"], name: "index_schools_on_admin0"
    t.index ["admin1"], name: "index_schools_on_admin1"
    t.index ["admin2"], name: "index_schools_on_admin2"
    t.index ["admin3"], name: "index_schools_on_admin3"
    t.index ["admin4"], name: "index_schools_on_admin4"
    t.index ["admin_code"], name: "index_schools_on_admin_code"
    t.index ["admin_id"], name: "index_schools_on_admin_id"
    t.index ["altitude"], name: "index_schools_on_altitude"
    t.index ["availability_connectivity"], name: "index_schools_on_availability_connectivity"
    t.index ["connectivity"], name: "index_schools_on_connectivity"
    t.index ["coords_within_country"], name: "index_schools_on_coords_within_country"
    t.index ["country_code"], name: "index_schools_on_country_code"
    t.index ["datasource"], name: "index_schools_on_datasource"
    t.index ["date_geo_validated"], name: "index_schools_on_date_geo_validated"
    t.index ["description"], name: "index_schools_on_description"
    t.index ["educ_level"], name: "index_schools_on_educ_level"
    t.index ["electricity"], name: "index_schools_on_electricity"
    t.index ["email"], name: "index_schools_on_email"
    t.index ["environment"], name: "index_schools_on_environment"
    t.index ["frequency"], name: "index_schools_on_frequency"
    t.index ["geoloc_confidence"], name: "index_schools_on_geoloc_confidence"
    t.index ["hasProbeData"], name: "index_schools_on_hasProbeData"
    t.index ["id_0"], name: "index_schools_on_id_0"
    t.index ["id_1"], name: "index_schools_on_id_1"
    t.index ["id_2"], name: "index_schools_on_id_2"
    t.index ["id_3"], name: "index_schools_on_id_3"
    t.index ["id_4"], name: "index_schools_on_id_4"
    t.index ["id_5"], name: "index_schools_on_id_5"
    t.index ["is_private"], name: "index_schools_on_is_private"
    t.index ["lat"], name: "index_schools_on_lat"
    t.index ["latency_connectivity"], name: "index_schools_on_latency_connectivity"
    t.index ["lon"], name: "index_schools_on_lon"
    t.index ["name"], name: "index_schools_on_name"
    t.index ["num_classrooms"], name: "index_schools_on_num_classrooms"
    t.index ["num_latrines"], name: "index_schools_on_num_latrines"
    t.index ["num_sections"], name: "index_schools_on_num_sections"
    t.index ["num_students"], name: "index_schools_on_num_students"
    t.index ["num_teachers"], name: "index_schools_on_num_teachers"
    t.index ["owner"], name: "index_schools_on_owner"
    t.index ["person_contact"], name: "index_schools_on_person_contact"
    t.index ["provider"], name: "index_schools_on_provider"
    t.index ["provider_is_private"], name: "index_schools_on_provider_is_private"
    t.index ["speed_connectivity"], name: "index_schools_on_speed_connectivity"
    t.index ["tower_code"], name: "index_schools_on_tower_code"
    t.index ["tower_dist"], name: "index_schools_on_tower_dist"
    t.index ["tower_latitude"], name: "index_schools_on_tower_latitude"
    t.index ["tower_longitude"], name: "index_schools_on_tower_longitude"
    t.index ["tower_type"], name: "index_schools_on_tower_type"
    t.index ["tower_type_service"], name: "index_schools_on_tower_type_service"
    t.index ["type_connectivity"], name: "index_schools_on_type_connectivity"
    t.index ["type_school"], name: "index_schools_on_type_school"
    t.index ["water"], name: "index_schools_on_water"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
