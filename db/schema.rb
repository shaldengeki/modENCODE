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

ActiveRecord::Schema.define(:version => 20120622192227) do

  create_table "aliases", :force => true do |t|
    t.string   "name"
    t.integer  "transcription_factor_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "aliases", ["name"], :name => "index_aliases_on_name"
  add_index "aliases", ["transcription_factor_id"], :name => "index_aliases_on_transcription_factor_id"

  create_table "attempts", :force => true do |t|
    t.integer  "pipeline_id"
    t.integer  "reagent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "started_at"
  end

  add_index "attempts", ["pipeline_id"], :name => "index_attempts_on_pipeline_id"
  add_index "attempts", ["reagent_id"], :name => "index_attempts_on_reagent_id"
  add_index "attempts", ["started_at"], :name => "index_attempts_on_started_at"

  create_table "attempts_users", :id => false, :force => true do |t|
    t.integer "attempt_id", :null => false
    t.integer "user_id",    :null => false
  end

  add_index "attempts_users", ["attempt_id", "user_id"], :name => "index_attempts_users_on_attempt_id_and_user_id", :unique => true
  add_index "attempts_users", ["user_id"], :name => "index_attempts_users_on_user_id"

  create_table "isoforms", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "transcription_factor_id"
    t.string   "flybase_id"
    t.string   "refseq_id"
  end

  add_index "isoforms", ["transcription_factor_id"], :name => "index_isoforms_on_transcription_factor_id"

  create_table "isoforms_reagents", :id => false, :force => true do |t|
    t.integer "isoform_id", :null => false
    t.integer "reagent_id", :null => false
  end

  add_index "isoforms_reagents", ["isoform_id", "reagent_id"], :name => "index_isoforms_reagents_on_isoform_id_and_reagent_id", :unique => true
  add_index "isoforms_reagents", ["reagent_id"], :name => "index_isoforms_reagents_on_reagent_id"

  create_table "pipelines", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "source_id"
    t.integer  "reagent_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "pipelines", ["reagent_type_id"], :name => "index_pipelines_on_reagent_type_id"
  add_index "pipelines", ["source_id"], :name => "index_pipelines_on_source_id"

  create_table "reagent_attributes", :force => true do |t|
    t.string   "name"
    t.integer  "reagent_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "reagent_attributes", ["reagent_type_id"], :name => "index_reagent_attributes_on_reagent_type_id"

  create_table "reagent_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reagent_values", :force => true do |t|
    t.string   "value"
    t.integer  "reagent_attribute_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "reagent_id"
  end

  add_index "reagent_values", ["reagent_attribute_id", "value"], :name => "index_reagent_values_on_reagent_attribute_id_and_value"

  create_table "reagents", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "source_id"
    t.integer  "reagent_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "tag_id"
  end

  add_index "reagents", ["reagent_type_id"], :name => "index_reagents_on_reagent_type_id"
  add_index "reagents", ["source_id"], :name => "index_reagents_on_source_id"
  add_index "reagents", ["tag_id"], :name => "index_reagents_on_tag_id"

  create_table "reagents_users", :id => false, :force => true do |t|
    t.integer "reagent_id", :null => false
    t.integer "user_id",    :null => false
  end

  add_index "reagents_users", ["reagent_id"], :name => "index_reagents_users_on_reagent_id", :unique => true
  add_index "reagents_users", ["user_id"], :name => "index_reagents_users_on_user_id", :unique => true

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "status_updates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "reagent_id"
    t.datetime "time"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "status_updates", ["reagent_id"], :name => "index_status_updates_on_reagent_id"
  add_index "status_updates", ["status_id"], :name => "index_status_updates_on_status_id"
  add_index "status_updates", ["user_id"], :name => "index_status_updates_on_user_id"

  create_table "statuses", :force => true do |t|
    t.string   "description"
    t.boolean  "start"
    t.boolean  "end"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "attempt_id"
    t.integer  "step_id"
    t.boolean  "success"
    t.boolean  "failure"
    t.datetime "started_at"
  end

  add_index "statuses", ["attempt_id"], :name => "index_statuses_on_attempt_id"
  add_index "statuses", ["started_at"], :name => "index_statuses_on_started_at"
  add_index "statuses", ["step_id"], :name => "index_statuses_on_step_id"
  add_index "statuses", ["user_id"], :name => "index_statuses_on_user_id"

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "pipeline_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  add_index "steps", ["name"], :name => "index_steps_on_name"
  add_index "steps", ["pipeline_id"], :name => "index_steps_on_pipeline_id"

  create_table "tags", :force => true do |t|
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "isoform_image_path"
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
