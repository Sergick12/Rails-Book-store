# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'associations' do
    subject { create(:genre) }

    it { is_expected.to have_many(:books_genres) }
    it { is_expected.to have_many(:books).through(:books_genres) }
  end

  describe 'validations' do
    subject { create(:genre) }
    it { is_expected.to validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4) }
  end
end
