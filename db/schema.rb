# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_113_212_507) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'authors_books', force: :cascade do |t|
    t.bigint 'author_id', null: false
    t.bigint 'book_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_id book_id], name: 'index_authors_books_on_author_id_and_book_id', unique: true
    t.index ['author_id'], name: 'index_authors_books_on_author_id'
    t.index ['book_id'], name: 'index_authors_books_on_book_id'
  end

  create_table 'books', force: :cascade do |t|
    t.string 'name'
    t.integer 'year'
    t.integer 'quantity', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books_genres', force: :cascade do |t|
    t.bigint 'genre_id', null: false
    t.bigint 'book_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_books_genres_on_book_id'
    t.index ['genre_id'], name: 'index_books_genres_on_genre_id'
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'subscribers', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.bigint 'book_id', null: false
    t.bigint 'subscriber_id', null: false
    t.boolean 'is_active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'start'
    t.datetime 'finish'
    t.index ['book_id'], name: 'index_subscriptions_on_book_id'
    t.index ['subscriber_id'], name: 'index_subscriptions_on_subscriber_id'
  end

  add_foreign_key 'authors_books', 'authors'
  add_foreign_key 'authors_books', 'books'
  add_foreign_key 'books_genres', 'books'
  add_foreign_key 'books_genres', 'genres'
  add_foreign_key 'subscriptions', 'books'
  add_foreign_key 'subscriptions', 'subscribers'
end
