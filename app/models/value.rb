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
  belongs_to :entity_value, class_name: 'Entity', foreign_key: :entity_value_id

  def value
    case property.data_type
    when Property::DataType::STRING
      string_value
    when Property::DataType::ENTITY
      entity_value
    end
  end
end
