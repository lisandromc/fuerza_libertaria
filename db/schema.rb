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

ActiveRecord::Schema.define(version: 20180517215408) do

  create_table "noticias", force: :cascade do |t|
    t.string "titulo"
    t.text "entradilla"
    t.string "autor"
    t.date "fecha_publicacion"
    t.boolean "publicada"
    t.text "cuerpo_markdown"
    t.text "cuerpo_html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "nombre", null: false
    t.string "domicilio"
    t.string "localidad"
    t.string "movil"
    t.string "profesion"
    t.string "areas_conocimiento"
    t.float "latitude"
    t.float "longitude"
    t.boolean "activo_mapa_liberal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dni"
    t.string "reset_token"
    t.datetime "reset_token_expire"
    t.boolean "administrador", null: false
    t.boolean "nombre_publico", null: false
    t.boolean "email_publico", null: false
    t.boolean "movil_publico", null: false
    t.boolean "profesion_publico", null: false
    t.boolean "areas_conocimiento_publico", null: false
    t.boolean "usuario_slack_publico", null: false
    t.boolean "perfil_facebook_publico", null: false
    t.string "usuario_slack"
    t.string "perfil_facebook"
    t.integer "provincia_id"
    t.date "fecha_nacimiento"
    t.string "perfil_instagram"
    t.string "perfil_twitter"
    t.boolean "coordinador", null: false
    t.boolean "referente", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["nombre"], name: "index_usuarios_on_nombre"
  end

end
