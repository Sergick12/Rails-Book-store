class AddUniqueIndexToAuthorBooks < ActiveRecord::Migration[7.0]
  def change
    add_index :authors_books, [:author_id, :book_id], unique: true
  end
end
