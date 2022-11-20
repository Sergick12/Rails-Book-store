# frozen_string_literal: true

class AuthorBlueprint < Blueprinter::Base
  identifier :id
  fields :name
  association :books, blueprint: BookBlueprint
end
