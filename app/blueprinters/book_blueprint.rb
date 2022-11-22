# frozen_string_literal: true

class BookBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :year, :quantity

  association :authors_books, name: :authors, blueprint: Books::AuthorBlueprint
  association :books_genres, name: :genres, blueprint: Books::GenreBlueprint
end
