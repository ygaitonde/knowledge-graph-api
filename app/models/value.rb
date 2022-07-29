class Value < ApplicationRecord
  belongs_to :property
  belongs_to :entity_value
end
