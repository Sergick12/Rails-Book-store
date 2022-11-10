# frozen_string_literal: true

module Subscribers
  class ShowAllIdReaderWithMax
    def self.call
      Subscription.group(:subscriber_id).count.max_by { |_key, value| value }[0]
    end
  end
end
