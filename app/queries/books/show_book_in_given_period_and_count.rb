module Books
  class ShowBookInGivenPeriodAndCount
    def self.call
      Subscription.group("start").count.transform_keys{ |k| k.year }
    end
  end
end