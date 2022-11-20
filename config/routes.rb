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
    namespace :admin do
      resources :authors
      resources :genres do
        resources :books
      end
      resources :books
      resources :subscribers do
        resources :subscriptions
      end
      resources :subscriptions
    end
  end
  # resources :subscriptions
  # resources :subscribersw
  # resources :authors
  # resources :books
  # resources :genres
end
