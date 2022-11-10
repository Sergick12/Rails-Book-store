# frozen_string_literal: true

class AuthorsBook < ApplicationRecord
  belongs_to :author
  belongs_to :book

  validates :author_id, presence: true, uniqueness: { scope: :book_id }
  validates :book_id, presence: true
end
