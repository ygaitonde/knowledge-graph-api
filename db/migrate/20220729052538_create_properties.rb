# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :label
      t.references :entity_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
