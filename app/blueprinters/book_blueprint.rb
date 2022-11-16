class BookBlueprint < Blueprinter::Base

  fields :name
  association :genres, blueprint: GenreBlueprint
  association :authors, blueprint: GenreBlueprint

end