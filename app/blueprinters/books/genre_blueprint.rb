module Books
  class GenreBlueprint < Blueprinter::Base
    field :name do |book_genre|
      book_genre.genre.name
    end
  end
end