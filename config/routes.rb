# frozen_string_literal: true

Rails.application.routes.draw do
  resources :subscriptions
  resources :authors_books
  resources :subscribers
  resources :authors
  resources :books_genres
  resources :books
  resources :genres
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
