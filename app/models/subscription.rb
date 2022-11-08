# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber
end
