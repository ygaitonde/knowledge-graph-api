# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!!d alongside the database with db:setup).

# fruit = EntityType.create!(label: 'Fruit')
# color = EntityType.create!(label: 'Color')
# fruit_name = Property.create!(label: 'Name', entity_type: fruit, data_type: Property::DataType::STRING)
# fruit_color = Property.create!(
#   label: 'Color',
#   entity_type: fruit,
#   data_type: Property::DataType::ENTITY,
#   reference_type: color
# )
# color_name = Property.create!(label: 'Name', entity_type: color, data_type: Property::DataType::STRING)

# color = EntityType.find_by(label: 'Color')
# fruit = EntityType.find_by(label: 'Fruit')
# color_name = Property.find_by(label: 'Name', entity_type: color)
# fruit_color = Property.find_by(label: 'Color', entity_type: fruit)
# fruit_name = Property.find_by(label: 'Name', entity_type: fruit)

# red = Entity.new(entity_type: color)
# red_values = [Value.new(entity: red, property: color_name, string_value: 'red')]
# red.save_with_values(red_values)

# apple = Entity.new(entity_type: fruit)
# apple_values = [
#   Value.new(entity: apple, property: fruit_name, string_value: 'apple'),
#   Value.new(entity: apple, property: fruit_color, entity_value: red)
# ]
# apple.save_with_values(apple_values)
