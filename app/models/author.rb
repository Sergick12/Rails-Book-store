# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :authors_books
  has_many :books, through: :authors_books

  validates_associated :authors_books

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  #validates :name, has_name_styles: true
end
