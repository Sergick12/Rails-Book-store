# frozen_string_literal: true

module Admin
    module Books
      class Destroy < BaseService
        def call
          ActiveRecord::Base.transaction do
            @book = Book.find(params[:id])
            @book.genres.destroy(@book.genres)
            @book.authors.destroy(@book.authors)
            @book.subscriptions.destroy(@book.subscriptions)
            @book.destroy
          end
          @book
        end
  end
end
end