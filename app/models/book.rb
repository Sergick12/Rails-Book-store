# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :books_genres
  has_many :genres, through: :books_genres
  has_many :authors_books
  has_many :authors, through: :authors_books
  has_many :subscriptions

  validates_associated :books_genres
  validates_associated :authors_books
  validates_associated :subscriptions

  validates :name, presence: true, length: { minimum: 3 }
  validates :year, numericality: { only_integer: true }
  validates :quantity, numericality: { only_integer: true }
  validates :name, uniqueness: { scope: :year, message: 'must be unique!' }

  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :genres
end
