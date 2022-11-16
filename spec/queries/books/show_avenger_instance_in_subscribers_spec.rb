require 'rails_helper'

RSpec.describe Books::ShowAvengerInstanceInSubscribers do
  before do
    @subscriber = create(:subscriber)
    create_list(:subscription, 3, subscriber: @subscriber)
    create_list(:subscriber_with_subscriptions, 5, subscriptions_count: 2)
    create_list(:subscription, 2, :active_false)
  end

  context '#call' do
    it do
      expect(described_class.call).to be_within(0.5).of(2.45)
    end
  end
end