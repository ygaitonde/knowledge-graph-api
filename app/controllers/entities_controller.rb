# frozen_string_literal: true

class EntitiesController < ApplicationController
  def create
    entity_type = EntityType.kept.find_by(label: entity_params[:type])

    return render json: { error: 'Entity type not found' }, status: :not_found unless entity_type.present?

    entity = Entity.new(entity_type: entity_type)

    values = entity.create_values_from_params(entity_params[:values].to_h)

    entity.save_with_values(values)

    if entity&.valid? && values.all?(&:valid?)
      render json: entity
    else
      value_errors = values&.map { |value| value.errors.full_messages }&.flatten
      # combine the errors and value errors into one array
      errors = entity&.errors&.full_messages&.concat(value_errors)&.flatten
      render json: { errors: errors }, status: :unprocessable_entity
    end
  end

  private

  def entity_params
    params.permit(:type, values: {})
  end
end
