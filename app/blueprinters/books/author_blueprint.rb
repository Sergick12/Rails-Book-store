# frozen_string_literal: true

module Books
  class AuthorBlueprint < Blueprinter::Base
    field :name do |author_book|
      author_book.author.name
    end
  end
end
