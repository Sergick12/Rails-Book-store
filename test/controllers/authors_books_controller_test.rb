# frozen_string_literal: true

require 'test_helper'

class AuthorsBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authors_book = authors_books(:one)
  end

  test 'should get index' do
    get authors_books_url
    assert_response :success
  end

  test 'should get new' do
    get new_authors_book_url
    assert_response :success
  end

  test 'should create authors_book' do
    assert_difference('AuthorsBook.count') do
      post authors_books_url,
           params: { authors_book: { authors_id: @authors_book.authors_id, books_id: @authors_book.books_id } }
    end

    assert_redirected_to authors_book_url(AuthorsBook.last)
  end

  test 'should show authors_book' do
    get authors_book_url(@authors_book)
    assert_response :success
  end

  test 'should get edit' do
    get edit_authors_book_url(@authors_book)
    assert_response :success
  end

  test 'should update authors_book' do
    patch authors_book_url(@authors_book),
          params: { authors_book: { authors_id: @authors_book.authors_id, books_id: @authors_book.books_id } }
    assert_redirected_to authors_book_url(@authors_book)
  end

  test 'should destroy authors_book' do
    assert_difference('AuthorsBook.count', -1) do
      delete authors_book_url(@authors_book)
    end

    assert_redirected_to authors_books_url
  end
end
