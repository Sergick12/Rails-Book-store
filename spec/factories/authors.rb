# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "Authors#{n}" }
    factory :author_with_books do
      transient do
        books_count { 5 }
      end
      after(:create) do |authors, evaluator|
        (0...evaluator.books_count).each do
          authors.books << FactoryBot.create(:book)
        end
        authors.reload
      end

    end
  end
end
