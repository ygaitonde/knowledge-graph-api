# frozen_string_literal: true

Rails.application.config.after_initialize do
  SchemaHelper.load_schema
end
