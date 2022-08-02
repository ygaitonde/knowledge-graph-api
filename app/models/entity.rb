# frozen_string_literal: true

# == Schema Information
#
# Table name: entities
#
#  id             :integer          not null, primary key
#  entity_type_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Entity < ApplicationRecord
  belongs_to :entity_type
  has_many :values

  validate :values_for_all_properties

  def values_for_all_properties
    entity_type.properties.each do |property|
      unless Value.find_by(property: property, entity: self).present?
        errors.add(:values, "missing value for #{property.label}")
      end
    end
  end

  def save_with_values!(values)
    transaction do
      values.each(&:save!)
      save!
    end
  end

  def create_values_from_params(values)
    values.map do |property_name, value|
      property = Property.where(entity_type: entity_type).find_by(label: property_name)

      create_value(property, value)
    end
  end

  def create_value(property, value)
    case property&.data_type
    when Property::DataType::STRING
      Value.new(entity: self, property: property, string_value: value)
    when Property::DataType::ENTITY
      entity_value = Entity.find_by(id: value)
      Value.new(entity: self, property: property, entity_value: entity_value)
    else
      Value.new
    end
  end
end
