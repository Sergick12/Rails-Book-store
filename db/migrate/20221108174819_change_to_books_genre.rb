class ChangeToBooksGenre < ActiveRecord::Migration[7.0]
  def change
    change_table :books_genres do |t|
      t.rename :genres_id, :genre_id
      t.rename :books_id, :book_id
    end
  end
end
