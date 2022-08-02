# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_729_053_923) do
  create_table 'entities', force: :cascade do |t|
    t.integer 'entity_type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['entity_type_id'], name: 'index_entities_on_entity_type_id'
  end

  create_table 'entity_types', force: :cascade do |t|
    t.string 'label'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'properties', force: :cascade do |t|
    t.string 'label'
    t.string 'data_type'
    t.integer 'entity_type_id', null: false
    t.integer 'reference_type_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['entity_type_id'], name: 'index_properties_on_entity_type_id'
    t.index ['reference_type_id'], name: 'index_properties_on_reference_type_id'
  end

  create_table 'values', force: :cascade do |t|
    t.integer 'entity_id'
    t.integer 'property_id', null: false
    t.string 'string_value'
    t.integer 'entity_value_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['entity_id'], name: 'index_values_on_entity_id'
    t.index ['entity_value_id'], name: 'index_values_on_entity_value_id'
    t.index ['property_id'], name: 'index_values_on_property_id'
  end

  add_foreign_key 'entities', 'entity_types'
  add_foreign_key 'properties', 'entity_types'
  add_foreign_key 'properties', 'entity_types', column: 'reference_type_id'
  add_foreign_key 'values', 'entities', column: 'entity_value_id'
  add_foreign_key 'values', 'properties'
end
