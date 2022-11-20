# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Authors', type: :request do
  describe '#index' do
    before do
      create(:author_with_books, books_count: 2)
    end

    it 'creates a Authors' do
      get '/api/v1/authors'
      expect(response).to have_http_status(:ok)
    end

    it 'retunrs five items' do
      get '/api/v1/authors.json'
      expect(JSON.parse(response.body).count).to eq(1)
    end
  end

  describe '#show' do
    before do
      create(:author_with_books, books_count: 2)
    end

    it 'returns count author books' do
      get '/api/v1/authors/10'
      expect(JSON.parse(response.body)['books'].count).to eq(2)
    end
  end
end
