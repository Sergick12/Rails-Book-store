class BookBlueprint < Blueprinter::Base
  fields :name , :year

  association :authors_books, name: :authors, blueprint: Books::AuthorBlueprint
  association :books_genres, name: :genres, blueprint: Books::GenreBlueprint
end