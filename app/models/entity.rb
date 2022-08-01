# frozen_string_literal: true

# == Schema Information
#
# Table name: entities
#
#  id             :integer          not null, primary key
#  name           :string
#  entity_type_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Entity < ApplicationRecord
  belongs_to :entity_type
  has_many :values
  has_many :properties, through: :entity_type

  def save_with_values!(values)
    transaction do
      save!
      values.each(&:save!)
    end
  end

  def create_values_from_params(values)
    values.map do |property_name, value|
      property = Property.where(entity_type: entity_type).find_by(label: property_name)
      create_value(property, value)
    end
  end

  def create_value(property, value)
    binding.pry
    case property.data_type
    when Property::DataType::STRING
      Value.new(entity: self, property: property, string_value: value)
    when Property::DataType::ENTITY
      entity_value = Entity.find_by(name: value)
      Value.new(entity: self, property: property, entity_value: entity_value)
    end
  end
end
