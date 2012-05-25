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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120525172905) do

  create_table "reagent_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reagents", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "transcription_factor_id"
    t.integer  "source_id"
    t.integer  "reagent_type_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "reagents", ["reagent_type_id"], :name => "index_reagents_on_reagent_type_id"
  add_index "reagents", ["source_id"], :name => "index_reagents_on_source_id"
  add_index "reagents", ["transcription_factor_id"], :name => "index_reagents_on_transcription_factor_id"

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transcription_factors", :force => true do |t|
    t.string   "name"
    t.string   "flybase_id"
    t.string   "cg_id"
    t.string   "refseq_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.integer  "source_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["source_id"], :name => "index_users_on_source_id"

end
