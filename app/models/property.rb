class Property < ApplicationRecord
  belongs_to :entity
  belongs_to :value
end
