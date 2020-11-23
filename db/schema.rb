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

ActiveRecord::Schema.define(version: 2020_11_20_211726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "carrete_id"
    t.integer "bet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carretes", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.string "direccion"
    t.integer "capacidad"
    t.integer "costo"
    t.integer "estado"
    t.integer "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha"
    t.bigint "comuna_id"
    t.integer "aprobado"
    t.string "code"
    t.index ["comuna_id"], name: "index_carretes_on_comuna_id"
  end

  create_table "carretes_servicios", id: false, force: :cascade do |t|
    t.bigint "carrete_id", null: false
    t.bigint "servicio_id", null: false
  end

  create_table "carretes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "carrete_id", null: false
  end

  create_table "comentariocarretes", force: :cascade do |t|
    t.integer "user"
    t.text "comentario"
    t.integer "carrete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "carrete_id"
    t.index ["carrete_id"], name: "index_comentariocarretes_on_carrete_id"
    t.index ["user_id"], name: "index_comentariocarretes_on_user_id"
  end

  create_table "comentarioservicios", force: :cascade do |t|
    t.integer "user"
    t.text "comentario"
    t.integer "servicio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "servicio_id"
    t.bigint "user_id"
    t.index ["servicio_id"], name: "index_comentarioservicios_on_servicio_id"
    t.index ["user_id"], name: "index_comentarioservicios_on_user_id"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comunas_servicios", id: false, force: :cascade do |t|
    t.bigint "comuna_id", null: false
    t.bigint "servicio_id", null: false
  end

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "capacidad"
    t.integer "costo"
    t.float "valoracion"
    t.string "categoria"
    t.integer "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "aprobado"
    t.index ["user_id"], name: "index_servicios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nombre", default: "", null: false
    t.integer "edad", default: 0, null: false
    t.integer "telefono", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carretes", "comunas"
  add_foreign_key "comentariocarretes", "carretes"
  add_foreign_key "comentariocarretes", "users"
  add_foreign_key "comentarioservicios", "servicios"
  add_foreign_key "comentarioservicios", "users"
  add_foreign_key "servicios", "users"
end
