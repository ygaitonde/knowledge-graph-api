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
  include Discard::Model

  has_many :entities
  has_many :properties

  class << self
    def create_types_from_labels(labels)
      labels.each { |label| EntityType.find_or_create_by!(label: label) } 
    end
  end
end
