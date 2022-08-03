# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    entity = Entity.find(params[:entity_id])

    if entity.valid?
      render json: entity.entity_type.properties.select(:id, :label, :data_type)
    else
      render json: { errors: entity.errors }, status: :unprocessable_entity
    end
  end
end
