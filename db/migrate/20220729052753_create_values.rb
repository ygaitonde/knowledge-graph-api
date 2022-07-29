# frozen_string_literal: true

class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.string :string_value
      t.references :entity_value, null: false, foreign_key: true
      t.string :data_type

      t.timestamps
    end
  end
end
