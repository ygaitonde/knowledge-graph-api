# frozen_string_literal: true

Rails.application.config.after_initialize do
  SchemaHelper.load_schema unless File.basename($PROGRAM_NAME) == 'rake' 
end
