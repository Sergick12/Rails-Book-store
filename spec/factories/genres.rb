# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "name#{n}" }
    factory :books_with_genre do
      transient do
        books_count { 5 }
      end
      after(:create) do |genres, evaluator|
        (0...evaluator.books_count).each do
          genres.books << FactoryBot.create(:book)
        end
        genres.reload
      end
    end
  end
end
