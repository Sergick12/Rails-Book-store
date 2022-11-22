# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/admin/books', type: :request do
  describe '#update' do
    context 'when update a Book without authors and genres' do
      let!(:params) { { book: FactoryBot.attributes_for(:book) } }
      before do
        create(:book)
      end

      it 'update a Book without author and genres' do
        patch "/api/admin/books/#{Book.all.first.id}", params: params
        expect(response).to have_http_status(:accepted)
      end
    end
    context 'when update a Book with authors name' do
      before do
        create(:author_with_books, books_count: 1)
      end
      let!(:author) { FactoryBot.create(:author) }
      let!(:author_attributes) { FactoryBot.attributes_for(:author) }
      let!(:book_attributes) { FactoryBot.attributes_for(:book) }
      let(:params_two_author_same_name) do
        {
          book: { name: 'books', year: 2000, quantity: 4,
                  authors_attributes: [{ name: 'Author' }, { name: 'Author' }] }
        }
      end
      let(:params_two_genre_same_name) do
        {
          book: { name: 'books', year: 2013, quantity: 4, genres_attributes: [{ name: 'Genre' }, { name: 'Genre' }] }
        }
      end
      let(:params_author) do
        {
          book: { name: 'books', year: 2012, quantity: 4,
                  authors_attributes: [{ name: 'Author1' }, { name: 'Author2' }] }
        }
      end
      let(:params_genre) do
        {
          book: { name: 'books', year: 2011, quantity: 4,
                  genres_attributes: [{ name: 'Genre1' }, { name: 'Genre2' }] }
        }
      end
      it 'update two a Book with the same author name' do
        patch '/api/admin/books/1', params: params_two_author_same_name == have_http_status(:unprocessable_entity)
      end

      it 'update two a Book with the same genre name' do
        patch '/api/admin/books/1', params: params_two_genre_same_name == have_http_status(:unprocessable_entity)
      end

      it 'creates a Book' do
        patch "/api/admin/books/#{Book.all.first.id}", params: params_author
        expect(response).to have_http_status(:accepted)
      end

      it 'creates a Book without genre' do
        patch "/api/admin/books/#{Book.all.first.id}", params: params_author
        expect(response).to have_http_status(:accepted)
      end

      it 'creates a Book without author' do
        patch "/api/admin/books/#{Book.all.first.id}", params: params_genre
        expect(response).to have_http_status(:accepted)
      end
    end
  end
end
