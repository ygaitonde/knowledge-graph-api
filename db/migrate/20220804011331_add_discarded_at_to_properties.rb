# frozen_string_literal: true

class AddDiscardedAtToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :discarded_at, :datetime
    add_index :properties, :discarded_at
  end
end
