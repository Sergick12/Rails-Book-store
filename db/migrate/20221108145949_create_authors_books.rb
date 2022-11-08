# frozen_string_literal: true

class CreateAuthorsBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :authors_books do |t|
      t.references :authors, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
