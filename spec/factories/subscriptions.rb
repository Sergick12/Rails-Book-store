# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    association :subscriber
    association :book
    is_active { true }
    # book{Book.create(name: 'Y reki', year: 2019, quantity: 3)}
    trait :in_active do
      is_active { false }
    end
    trait :with_old_book do
      association :book, factory: %i[book old]
    end
  end
end
