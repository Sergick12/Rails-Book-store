# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
      resources :authors do
        resources :books
      end
      resources :genres do
        resources :books
      end
        resources :subscribers do
          resources :subscriptions
        end
      end
    end

  # resources :subscriptions
  # resources :subscribers
  # resources :authors
  # resources :books
  # resources :genres
end
