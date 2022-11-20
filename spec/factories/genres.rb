# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "name#{n}" }
  end
  
end
