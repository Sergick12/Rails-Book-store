# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Books', type: :request do
  describe '#index' do
    before do
      create(:author_with_books, books_count: 2)
    end

    it 'creates a Books' do
      get '/api/v1/books'
      expect(response).to have_http_status(:ok)
    end

    it 'retunrs five items' do
      get '/api/v1/books.json'
      expect(JSON.parse(response.body).count).to eq(2)
    end
  end
  describe '#show' do
    before do
      create(:book, :true_name)
    end
    it 'return book' do
      get "/api/v1/books/#{Book.all.first.id}"
      expect(JSON.parse(response.body)['name']).to eq('name5')
    end
  end
end
