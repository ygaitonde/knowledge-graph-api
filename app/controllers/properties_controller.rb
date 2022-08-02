# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    entity = Entity.find(params[:entity_id])
    render json: entity.entity_type.properties.select(:id, :label, :data_type)
  end
end
