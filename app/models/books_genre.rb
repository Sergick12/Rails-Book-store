# frozen_string_literal: true

class BooksGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :book

  validates :book_id, presence: true, uniqueness: { scope: :genre_id }
  validates :genre_id, presence: true
end
