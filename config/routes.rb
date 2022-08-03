# frozen_string_literal: true

Rails.application.routes.draw do
  # create a new entity with a give type and keys
  resources :entities, only: %i[create] do
    # get all properties for an entity
    resources :properties, only: %i[index]
    # query chain of properties starting at an entity
    resource :values, only: %i[show]
  end
end
