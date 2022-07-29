# frozen_string_literal: true

# == Schema Information
#
# Table name: entity_types
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EntityType < ApplicationRecord
  has_many :entities
  has_many :properties
end
