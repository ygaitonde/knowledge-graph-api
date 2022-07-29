# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fruit = EntityType.create(label: 'Fruit')
color = EntityType.create(label: 'Color')
fruit_name = Property.create(label: 'Name', entity_type: fruit, data_type: Property::DataType::STRING)
fruit_color = Property.create(label: 'Color', entity_type: fruit, data_type: Property::DataType::ENTITY)
color_name = Property.create(label: 'Name', entity_type: color, data_type: Property::DataType::STRING)
apple = Entity.create(entity_type: fruit, name: 'abc123')
red = Entity.create(entity_type: color, name: 'def456')
Value.create(entity: apple, property: fruit_name, string_value: 'apple')
Value.create(entity: apple, property: fruit_color, entity_value: red)
Value.create(entity: red, property: color_name, string_value: 'red')
