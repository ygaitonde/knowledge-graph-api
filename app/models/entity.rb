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
end
