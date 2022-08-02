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
  module DataType
    STRING = 'string'
    ENTITY = 'entity'
  end

  belongs_to :entity_type
  belongs_to :reference_type, class_name: 'EntityType', foreign_key: :reference_type_id
end
