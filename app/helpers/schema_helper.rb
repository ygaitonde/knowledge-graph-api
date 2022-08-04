# frozen_string_literal: true

class SchemaHelper
  class << self
    def teardown
      Property.discard_all
      EntityType.discard_all
    end

    def load_schema
      teardown

      json_path = File.join(Rails.root, 'config', 'schema.json')
      file = File.read(json_path)

      raise 'Please add schema.json to /config.' unless file.present?

      schema = JSON.parse file

      ActiveRecord::Base.transaction do
        EntityType.create_types_from_labels(schema['types'].map { |type| type['name'] })

        # create properties, this needs to be separate so that the references work
        schema['types'].each do |type|
          entity_type = EntityType.find_by(label: type['name'])

          type['keys'].each do |key|
            property = Property.initialize_from_schema(key, entity_type)
            if property.new_record?
              property.save!
            else
              property.undiscard
            end
          end
        end
      end
    end
  end
end
