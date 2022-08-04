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
  validate :type_not_discarded

  # we either reduce the chain until we find a terminal value or return nil
  def find_value_from_chain(chain)
    chain.reduce(self) do |acc, property_name|
      property = Property.kept.find_by(entity_type: acc&.entity_type, label: property_name)

      return nil unless property.present?

      Value.find_by(property: property, entity: acc).value
    end
  end

  def save_with_values(values)
    ActiveRecord::Base.transaction do
      # we need to update the value entity id before we can save the entity
      values.each { |v| v.update(entity_id: id) }
      save
      values.each(&:save)
    end
  end

  def create_values_from_params(values)
    values.map do |property_name, value|
      property = Property.kept.where(entity_type: entity_type).find_by(label: property_name)

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

  private

  def values_for_all_properties
    entity_type.properties.each do |property|
      unless Value.find_by(property: property, entity: self).present?
        errors.add(:values, "missing value for #{property.label}")
      end
    end
  end

  def type_not_discarded
    return if entity_type.present? && entity_type.kept?

    errors.add(:entity_type, 'is discarded')
  end
end
