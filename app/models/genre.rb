# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :books_genres
  has_many :books, through: :books_genres

  validates_associated :books_genres

  validates :name, presence: true
  validates :name, length: { minimum: 4 }
  validates :name, uniqueness: true
end
