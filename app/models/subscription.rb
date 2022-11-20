# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber

  validates :is_active, inclusion: { in: [true, false] }
  validates :start, presence: true
  validates :finish, presence: true
end
