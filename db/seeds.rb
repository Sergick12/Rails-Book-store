# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Subscription.delete_all
AuthorsBook.delete_all
BooksGenre.delete_all
Book.delete_all
Genre.delete_all
Author.delete_all
Subscriber.delete_all

10.times do |index|
  Genre.create(name: "genre#{index}")
  Author.create(name: "author#{index}")
  Subscriber.create(name: "subscriber#{index}")
end

20.times do |book|
  Book.create(name: "book#{book}", year: rand(1700..2022), quantity: rand(0..100))

  genres = Genre.order(Arel.sql('RANDOM()')).first(2)
  Book.last.genres << genres
  authors = Author.order(Arel.sql('RANDOM()')).first(2)
  Book.last.authors << authors
end

20.times do |_index|
  subscriber = Subscriber.order(Arel.sql('RANDOM()')).first
  book = Book.order(Arel.sql('RANDOM()')).first
  delete_at = DateTime.new(rand(2015..2020), rand(1..12), rand(1..28))
  Subscription.create!(subscriber:,
                       book:,
                       is_active: [true, false].sample)
end
