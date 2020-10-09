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

ActiveRecord::Schema.define(version: 2020_10_09_204643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carretes", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.string "direccion"
    t.integer "capacidad"
    t.integer "costo"
    t.integer "estado"
    t.string "imagen"
    t.integer "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "capacidad"
    t.integer "costo"
    t.float "valoracion"
    t.string "imagen"
    t.string "categoria"
    t.integer "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_servicios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nombre", default: "", null: false
    t.integer "edad", default: 0, null: false
    t.string "imagen", default: "", null: false
    t.integer "telefono", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comentariocarretes", "carretes"
  add_foreign_key "comentariocarretes", "users"
  add_foreign_key "comentarioservicios", "servicios"
  add_foreign_key "comentarioservicios", "users"
  add_foreign_key "servicios", "users"
end
