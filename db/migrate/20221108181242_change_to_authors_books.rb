class ChangeToAuthorsBooks < ActiveRecord::Migration[7.0]
  def change
    change_table :authors_books do |t|
      t.rename :authors_id, :author_id
      t.rename :books_id, :book_id
    end
  end
end
