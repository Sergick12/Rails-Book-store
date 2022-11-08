# frozen_string_literal: true

class Subscriber < ApplicationRecord
  has_many :subscriptions
end
