# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    year { rand(2017..2020) }
    quantity { rand(1..15) }
    trait :true_name do
      name { 'name5' }
    end
    trait :old do
      year { rand(1900..1940) }
    end
    factory :books_with_genre do
      transient do
        genres_count { 5 }
      end
      after(:create) do |books, evaluator|
        create_list(:genre, evaluator.genres_count, books: [books])
        books.reload
      end
    end
  end
end
