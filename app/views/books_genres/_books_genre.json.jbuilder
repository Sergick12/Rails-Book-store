# frozen_string_literal: true

json.extract! books_genre, :id, :genres_id, :books_id, :created_at, :updated_at
json.url books_genre_url(books_genre, format: :json)
