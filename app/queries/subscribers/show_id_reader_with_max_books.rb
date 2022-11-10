# frozen_string_literal: true

module Subscribers
  class ShowIdReaderWithMaxBooks
    def self.call
      count_subscriber = Subscription.group(:subscriber_id).count
      max = count_subscriber.values.max
      count_max = count_subscriber.values.count(max)
      count_subscriber.max_by(count_max) { |_key, value| value }.to_h.keys
    end
  end
end
