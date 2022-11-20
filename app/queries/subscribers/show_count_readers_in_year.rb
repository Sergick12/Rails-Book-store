# frozen_string_literal: true

module Subscribers
  class ShowAllIdReaderWithMax
    def self.call
      Subscription.group('start').uniq.count.transform_keys(&:year)
    end
  end
end
