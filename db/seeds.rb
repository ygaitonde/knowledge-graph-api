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
fruit_color = Property.create(
  label: 'Color',
  entity_type: fruit,
  data_type: Property::DataType::ENTITY,
  reference_type: color
)
color_name = Property.create(label: 'Name', entity_type: color, data_type: Property::DataType::STRING)

apple = Entity.new(entity_type: fruit)
red = Entity.new(entity_type: color)

Value.create(entity: apple, property: fruit_name, string_value: 'apple')
Value.create(entity: apple, property: fruit_color, entity_value: red)
Value.create(entity: red, property: color_name, string_value: 'red')

apple.save!
red.save!
