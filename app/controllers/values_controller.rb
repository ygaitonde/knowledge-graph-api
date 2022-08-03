# frozen_string_literal: true

class ValuesController < ApplicationController
  def show
    entity = Entity.find(params[:entity_id])

    return render json: { error: 'Entity not found' }, status: :not_found unless entity.present?

    value = entity.find_value_from_chain(chain)

    return render json: { error: 'Value not found' }, status: :not_found unless value.present?

    render json: value
  end

  private

  def show_params
    params.permit(chain: [])
  end
end
