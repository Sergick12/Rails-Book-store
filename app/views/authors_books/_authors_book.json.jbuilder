# frozen_string_literal: true

json.extract! authors_book, :id, :authors_id, :books_id, :created_at, :updated_at
json.url authors_book_url(authors_book, format: :json)
