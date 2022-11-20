# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Books::ShowBookInGivenPeriodAndCount do
  before do
    @subscriber = create(:subscriber)
    create_list(:subscription, 5, start: DateTime.new(2018))
  end

  context '#call' do
    it do
      expect(described_class.call).to eq({ 2018 => 5 })
    end
  end
end
