# frozen_string_literal: true

# Subscription.joins(:subscriber).eager_load(:subscriber).find_each { |x| p
#   "#{x&.subscriber&.name}" }

module Books
  class ShowUniqAllBook
    def self.call
      is_active = Subscription.where('is_active = ?', true)
      active_books = is_active.count('DISTINCT book_id')
      active_subscribers = is_active.group(:subscriber_id).count.length
      active_books / active_subscribers
    end
  end
end
