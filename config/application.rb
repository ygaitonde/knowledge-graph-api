# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EntityApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = 'Central Time (US & Canada)'
    # config.eager_load_paths << Rails.root.join('extras')

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    def load_schema
    end
    #   ActiveRecord::Base.transaction do
    #     json_path = File.join(Rails.root, 'config', 'schema.json')
    #     file = File.read(json_path)
    #     schema = JSON.parse file

    #     ActiveRecord::Base.transaction do
    #       EntityType.create_types_from_labels(schema['types'].map { |type| type['name'] })

    #       # create properties, this needs to be separate so that the references work
    #       schema['types'].each do |type|
    #         entity_type = EntityType.find_by(label: type['name'])

    #         type['keys'].each do |key|
    #           case key['type']['name']
    #           when Property::DataType::STRING
    #             Property.create(entity_type: entity_type, label: key['name'], data_type: Property::DataType::STRING)
    #           when Property::DataType::ENTITY
    #             binding.pry
    #             reference_type = EntityType.find_by(label: key['type']['referenceType'])

    #             raise StandardError if reference_type.nil?

    #             Property.create(
    #               entity_type: entity_type,
    #               label: key['name'],
    #               data_type: Property::DataType::ENTITY,
    #               reference_type: reference_type
    #             ).sql
    #           end
    #         end
    #       end
    #     end
    #   end
    # end

    # def teardown
    #   Rails.application.load_tasks
    #   Rake::Task['db:reset'].invoke
    # end

    config.after_initialize do
      # teardown
      # load_schema
    end
  end
end
