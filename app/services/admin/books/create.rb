module Admin
    module Books
      class Create < BaseService
        def call
          ActiveRecord::Base.transaction do
            @book = Book.create!(book_params)
            add_authors!
            add_genres!
            @book.save!
          end
          @book
        end
  
        private
  
        def add_authors!
          authors_attributes.each do |author_attributes|
            author = Author.find_or_create_by(author_attributes.permit(:id, :name))
            @book.authors << author
          end
        end
  
        def add_genres!
          genres_attributes.each do |genre_attributes|
            genre = Genre.find_or_create_by(genre_attributes.permit(:id, :name))
            @book.genres << genre
          end
        end
  
        def book_params
          params.require(:book).permit(:name, :year, :quantity)
        end
  
        def authors_attributes
          @author_ids ||= (params[:book][:authors_attributes].presence || [])
        end
  
        def genres_attributes
          @genre_ids ||= (params[:book][:genres_attributes].presence || [])
        end
      end
    end
  end