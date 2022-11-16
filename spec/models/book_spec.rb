# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'associations' do
    subject { create(:book) }

  end

  describe 'validations' do
    subject { build(:book) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:year) }
    it { should validate_numericality_of(:year) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_numericality_of(:year) }
    it { should validate_numericality_of(:quantity) }
  end
end