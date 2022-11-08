# frozen_string_literal: true

require 'application_system_test_case'

class BooksGenresTest < ApplicationSystemTestCase
  setup do
    @books_genre = books_genres(:one)
  end

  test 'visiting the index' do
    visit books_genres_url
    assert_selector 'h1', text: 'Books genres'
  end

  test 'should create books genre' do
    visit books_genres_url
    click_on 'New books genre'

    fill_in 'Books', with: @books_genre.books_id
    fill_in 'Genres', with: @books_genre.genres_id
    click_on 'Create Books genre'

    assert_text 'Books genre was successfully created'
    click_on 'Back'
  end

  test 'should update Books genre' do
    visit books_genre_url(@books_genre)
    click_on 'Edit this books genre', match: :first

    fill_in 'Books', with: @books_genre.books_id
    fill_in 'Genres', with: @books_genre.genres_id
    click_on 'Update Books genre'

    assert_text 'Books genre was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Books genre' do
    visit books_genre_url(@books_genre)
    click_on 'Destroy this books genre', match: :first

    assert_text 'Books genre was successfully destroyed'
  end
end
