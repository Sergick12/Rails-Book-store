# frozen_string_literal: true

json.array! @authors_books, partial: 'authors_books/authors_book', as: :authors_book
