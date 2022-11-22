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
  end
end
