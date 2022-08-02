# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :label
      t.string :data_type
      t.references :entity_type, null: false, foreign_key: true
      t.references :reference_type, null: true, foreign_key: { to_table: :entity_types }

      t.timestamps
    end
  end
end
