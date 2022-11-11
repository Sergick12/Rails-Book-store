# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "name#{n}" }
    factory :author_with_book do
      transient do
        count { 5 }
      end
      after(:create) do |authors, evaluator|
        create_list(:book, evaluator.books_count, authors: [authors])

        authors.reload
      end
    end
  end
end