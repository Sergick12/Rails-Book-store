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

# 10.times do |index|
#   Genre.create(name: "genre#{index}")
#   Author.create(name: "author#{index}")
#   Subscriber.create(name: "subscriber#{index}")
# end

# 20.times do |book|
#   Book.create(name: "book#{book}", year: rand(1700..2022), quantity: rand(0..100))

#   genres = Genre.order(Arel.sql('RANDOM()')).first(2)
#   Book.last.genres << genres
#   authors = Author.order(Arel.sql('RANDOM()')).first(2)
#   Book.last.authors << authors
# end

# 20.times do |_index|
#   subscriber = Subscriber.order(Arel.sql('RANDOM()')).first
#   book = Book.order(Arel.sql('RANDOM()')).first
#   Subscription.create!(subscriber: subscriber,
#                        book: book,
#                        is_active: [true, false].sample)
# end


Author.create!(name: 'Д. Кнут')
Author.create!(name: 'А. Азимов')
Author.create!(name: 'Д. Карнеги')
Author.create!(name: 'Л.Д. Ландау')
Author.create!(name: 'Е.М. Лифшиц')
Author.create!(name: 'Б. Страуструп')
Author.create!(name: 'А.С. Пушкин')

Book.create!(name: 'Евгений Онегин', year: 1985, quantity: 2)
Book.create!(name: 'Сказка о рыбаке и рыбке', year: 1990, quantity: 3)
Book.create!(name: 'Основание и империя', year: 2000, quantity: 5)
Book.create!(name: 'Психология программирования', year: 1998, quantity: 1)
Book.create!(name: 'Язык программирования С++', year: 1996, quantity: 3)
Book.create!(name: 'Курс теоритической физики', year: 1981, quantity: 12)
Book.create!(name: 'Искусство программирования', year: 1993, quantity: 7)

Genre.create!(name: 'Поэзия')
Genre.create!(name: 'Программирование')
Genre.create!(name: 'Психология')
Genre.create!(name: 'Наука')
Genre.create!(name: 'Классика')
Genre.create!(name: 'Фантастика')

Subscriber.create!(name: 'Иванов И.И.')
Subscriber.create!(name: 'Петров П.П.')
Subscriber.create!(name: 'Сидоров С.С.')
Subscriber.create!(name: 'Сидоров С.С.')

authors = Author.all
books = Book.all 
genres = Genre.all
subscribers = Subscriber.all

AuthorsBook.create!(book: books[0], author: authors[6])
AuthorsBook.create!(book: books[1], author: authors[6])
AuthorsBook.create!(book: books[2], author: authors[1])
AuthorsBook.create!(book: books[3], author: authors[2])
AuthorsBook.create!(book: books[3], author: authors[5])
AuthorsBook.create!(book: books[4], author: authors[5])
AuthorsBook.create!(book: books[5], author: authors[4])
AuthorsBook.create!(book: books[5], author: authors[3])
AuthorsBook.create!(book: books[6], author: authors[0])

BooksGenre.create!(book: books[0], genre: genres[0])
BooksGenre.create!(book: books[0], genre: genres[4])
BooksGenre.create!(book: books[1], genre: genres[0])
BooksGenre.create!(book: books[1], genre: genres[4])
BooksGenre.create!(book: books[2], genre: genres[5])
BooksGenre.create!(book: books[3], genre: genres[1])
BooksGenre.create!(book: books[3], genre: genres[2])
BooksGenre.create!(book: books[4], genre: genres[1])
BooksGenre.create!(book: books[5], genre: genres[4])
BooksGenre.create!(book: books[6], genre: genres[1])
BooksGenre.create!(book: books[6], genre: genres[4])

Subscription.create!(subscriber: subscribers[0], book: books[2], start: DateTime.new(2011, 1, 12), finish: DateTime.new(2011, 02, 12), is_active: false)
Subscription.create!(subscriber: subscribers[0], book: books[0], start: DateTime.new(2011, 1, 12), finish: DateTime.new(2011, 02, 12), is_active: false)
Subscription.create!(subscriber: subscribers[2], book: books[2], start: DateTime.new(2012, 5, 17), finish: DateTime.new(2012, 07, 17), is_active: true)
Subscription.create!(subscriber: subscribers[0], book: books[1], start: DateTime.new(2012, 6, 11), finish: DateTime.new(2012, 8, 11), is_active: false)
Subscription.create!(subscriber: subscribers[3], book: books[4], start: DateTime.new(2012, 6, 11), finish: DateTime.new(2012, 8, 11), is_active: false)
Subscription.create!(subscriber: subscribers[0], book: books[6], start: DateTime.new(2014, 8, 3), finish: DateTime.new(2014, 10, 3), is_active: false)
Subscription.create!(subscriber: subscribers[2], book: books[4], start: DateTime.new(2014, 8, 3), finish: DateTime.new(2014, 10, 3), is_active: true)
Subscription.create!(subscriber: subscribers[2], book: books[0], start: DateTime.new(2014, 8, 3), finish: DateTime.new(2014, 9, 3), is_active: true)
Subscription.create!(subscriber: subscribers[3], book: books[0], start: DateTime.new(2015, 10, 7), finish: DateTime.new(2015, 3, 7), is_active: true)
Subscription.create!(subscriber: subscribers[0], book: books[3], start: DateTime.new(2015, 10, 7), finish: DateTime.new(2015, 11, 7), is_active: false)
Subscription.create!(subscriber: subscribers[3], book: books[3], start: DateTime.new(2015, 10, 8), finish: DateTime.new(2025, 11, 8), is_active: true)
