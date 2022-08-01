# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    entity = Entity.find(params[:entity_id])
    binding.pry
    render json: entity.properties.select(:id, :label, :data_type)
  end
end
