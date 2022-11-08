# frozen_string_literal: true

require 'test_helper'

class BooksGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @books_genre = books_genres(:one)
  end

  test 'should get index' do
    get books_genres_url
    assert_response :success
  end

  test 'should get new' do
    get new_books_genre_url
    assert_response :success
  end

  test 'should create books_genre' do
    assert_difference('BooksGenre.count') do
      post books_genres_url,
           params: { books_genre: { books_id: @books_genre.books_id, genres_id: @books_genre.genres_id } }
    end

    assert_redirected_to books_genre_url(BooksGenre.last)
  end

  test 'should show books_genre' do
    get books_genre_url(@books_genre)
    assert_response :success
  end

  test 'should get edit' do
    get edit_books_genre_url(@books_genre)
    assert_response :success
  end

  test 'should update books_genre' do
    patch books_genre_url(@books_genre),
          params: { books_genre: { books_id: @books_genre.books_id, genres_id: @books_genre.genres_id } }
    assert_redirected_to books_genre_url(@books_genre)
  end

  test 'should destroy books_genre' do
    assert_difference('BooksGenre.count', -1) do
      delete books_genre_url(@books_genre)
    end

    assert_redirected_to books_genres_url
  end
end
