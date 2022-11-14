require 'rails_helper'

RSpec.describe AuthorsBook, type: :model do
  describe 'associations' do 
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:author) }
  end

  describe 'validations' do
    subject {create(:authors_book)}

    it { is_expected.to validate_presence_of(:book_id)}
    it { is_expected.to validate_presence_of(:author_id)}
    it { is_expected.to validate_uniqueness_of(:book_id).scoped_to(:author_id) }
  end
end