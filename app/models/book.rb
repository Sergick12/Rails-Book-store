# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :books_genres
  has_many :genres, through: :books_genres
  has_many :authors_books
  has_many :authors, through: :authors_books
  has_many :subscriptions
  validates :name, length: { minimum: 3 }
  validates :year, inclusion: { in: (1700..2022),
                                message: '%<value> is not a valid size', allow_nil: true }
end
