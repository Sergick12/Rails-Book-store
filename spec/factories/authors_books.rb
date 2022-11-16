FactoryBot.define do
  factory :books_genre do
      association :book
      association :genre
  end
end