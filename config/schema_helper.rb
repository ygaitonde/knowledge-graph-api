# frozen_string_literal: true

module EntityApi
  class Application < Rails::Application
    def load_schema
      p 'loading schema'
    end
  end
end
