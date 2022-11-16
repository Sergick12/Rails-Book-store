# frozen_string_literal: true

module Books
  class ShowAvengerInstanceInSubscribers
    def self.call
      is_active = Subscription.where('is_active = ?', true)
      active_books = is_active.count.values.sum(0.0)
      active_subscribers = is_active.group(:subscriber_id).count.length
      active_books / active_subscribers
    end
  end
end
