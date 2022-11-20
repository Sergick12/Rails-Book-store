# frozen_string_literal: true

class AddUniqueIndexToAuthorBooks < ActiveRecord::Migration[7.0]
  def change
    add_index :authors_books, %i[author_id book_id], unique: true
  end
end
