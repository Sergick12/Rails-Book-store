# frozen_string_literal: true

json.array! @books_genres, partial: 'books_genres/books_genre', as: :books_genre
