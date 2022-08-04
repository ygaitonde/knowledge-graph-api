# frozen_string_literal: true

# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  label             :string
#  data_type         :string
#  entity_type_id    :integer          not null
#  reference_type_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Property < ApplicationRecord
  include Discard::Model

  module DataType
    STRING = 'string'
    ENTITY = 'entity'
  end

  belongs_to :entity_type
  belongs_to :reference_type, class_name: 'EntityType', foreign_key: :reference_type_id, optional: true

  class << self
    def initialize_from_schema(key, entity_type)
      case key['type']['name']
      when Property::DataType::STRING
        Property.find_or_initialize_by(entity_type: entity_type, label: key['name'],
                                       data_type: Property::DataType::STRING)
      when Property::DataType::ENTITY
        reference_type = EntityType.find_by(label: key['type']['referenceType'])

        raise "Invalid reference type on property #{key['name']}." if reference_type.nil?

        Property.find_or_initialize_by(
          entity_type: entity_type,
          label: key['name'],
          data_type: Property::DataType::ENTITY,
          reference_type: reference_type
        )
      end
    end
  end
end
