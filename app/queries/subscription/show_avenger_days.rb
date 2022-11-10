# frozen_string_literal: true

module Subscription
  class ShowAvengerDays
    def self.call
      active_false = Subscription.where('is_active = ?', false).sum('finish - start')
      active_true = Subscription.where('is_active = ?', true).sum('CURRENT_DATE - start')
      all_sum_day = active_false + active_true
      count_book = Subscription.count
      all_sum_day / count_book
    end
  end
end
