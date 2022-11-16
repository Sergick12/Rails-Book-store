# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors do
        resources :books
      end
    end
  end

   resources :subscriptions
   resources :authors_books
   resources :subscribers
   resources :books_genres
   resources :books
   resources :genres

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
