# frozen_string_literal: true

class ValuesController < ApplicationController
  def show
    entity = Entity.find(params[:entity_id])

    return render json: { error: 'Invalid entity' }, status: :not_found unless entity.present? && entity.valid?

    value = entity.find_value_from_chain(params[:chain])

    return render json: { error: 'Value not found' }, status: :not_found unless value.present?

    render json: value
  end

  private

  def show_params
    params.require(:chain)
  end
end
