# frozen_string_literal: true

class Subscriber < ApplicationRecord
  has_many :subscriptions

  validates :name, presence: true

  validates_associated :subscriptions

  validates :name, presence: true
end
