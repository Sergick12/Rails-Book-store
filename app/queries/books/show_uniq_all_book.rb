# frozen_string_literal: true

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
