# frozen_string_literal: true

class AddDiscardedAtToEntityTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :entity_types, :discarded_at, :datetime
    add_index :entity_types, :discarded_at
  end
end
