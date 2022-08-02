# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :entity_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
