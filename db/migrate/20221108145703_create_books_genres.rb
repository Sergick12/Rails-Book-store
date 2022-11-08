# frozen_string_literal: true

class CreateBooksGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :books_genres do |t|
      t.references :genres, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
