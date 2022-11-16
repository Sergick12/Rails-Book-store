# frozen_string_literal: true

module Subscriptions
  class ShowAvengerDaysWhenIsActiveFalse
    def self.call
      is_active = Subscription.where('is_active = ?', false)
      all_day = is_active.sum('finish - start')
      count_return_book = is_active.group(:subscriber_id).count.values.sum
      all_day / count_return_book
    end
  end
end
