# frozen_string_literal: true

class CreateEntityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_types do |t|
      t.string :label

      t.timestamps
    end
  end
end
