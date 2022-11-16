# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    association :subscriber
    association :book
    is_active{ true }
    start { DateTime.new(rand(2018..2020), rand(1..5), rand(1..28), 10, 5, 6) }
    finish { DateTime.new(rand(2020..2022), rand(1..5), rand(1..28), 10, 5, 6) }
    trait :active_false do
      is_active { false }
    end
    trait :with_old_book do
      association :book, factory: %i[book old]
    end
  end
end
