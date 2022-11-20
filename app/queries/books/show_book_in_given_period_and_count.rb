# frozen_string_literal: true

module Books
  class ShowBookInGivenPeriodAndCount
    def self.call
      Subscription.group('start').count.transform_keys(&:year)
    end
  end
end
