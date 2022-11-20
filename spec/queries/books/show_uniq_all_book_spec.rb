# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Books::ShowUniqAllBook do
  before do
    @subscriber = create(:subscriber)
    create_list(:subscription, 8, subscriber: @subscriber)
    create_list(:subscription, 2, :active_false)
  end

  context '#call' do
    it do
      expect(described_class.call).to eq(8)
    end
  end
end
