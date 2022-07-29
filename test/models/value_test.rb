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
require 'test_helper'

class ValueTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end
end
