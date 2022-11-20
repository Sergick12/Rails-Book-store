# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksGenre, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:genre) }
  end

  describe 'validations' do
    subject { create(:books_genre) }

    it { is_expected.to validate_presence_of(:book_id) }
    it { is_expected.to validate_presence_of(:genre_id) }
    it { is_expected.to validate_uniqueness_of(:book_id).scoped_to(:genre_id) }
  end
end
