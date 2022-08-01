# frozen_string_literal: true

class EntitiesController < ApplicationController
  def create
    entity_type = EntityType.find_by(label: entity_params[:type])

    entity = Entity.new(name: entity_params[:name], entity_type: entity_type)

    values = entity.create_values_from_params(entity_params[:values].to_h)

    if entity.valid? && values.all?(&:valid?)
      entity.save_with_values!(values)
      render json: entity
    else
      render json: { errors: entity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def entity_params
    params.permit(:type, :name, values: {})
  end
end
