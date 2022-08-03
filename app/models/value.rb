# frozen_string_literal: true

# == Schema Information
#
# Table name: values
#
#  id              :integer          not null, primary key
#  entity_id       :integer
#  property_id     :integer          not null
#  string_value    :string
#  entity_value_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Value < ApplicationRecord
  belongs_to :property
  belongs_to :entity
  belongs_to :entity_value, class_name: 'Entity', foreign_key: :entity_value_id, optional: true

  validate :valid_entity_value

  def value
    case property.data_type
    when Property::DataType::STRING
      string_value
    when Property::DataType::ENTITY
      entity_value
    end
  end

  def valid_entity_value
    return if property&.data_type == Property::DataType::STRING || entity_matches_reference?

    errors.add(:entity_value, 'must be valid')
  end

  private

  def entity_matches_reference?
    entity_value&.entity_type == property&.reference_type
  end
end
