# frozen_string_literal: true

module Api
  module Admin
    class BooksController < ApplicationController
      before_action :set_book, only: %i[show edit update destroy]

      # GET /books or /books.json
      def index
        @books = Book.includes(:genres, :authors)
        render json: BookBlueprint.render(@books)
      end

      # GET /books/1 or /books/1.json
      def show; end

      # GET /books/new
      def new
        @book = Book.new
      end

      # GET /books/1/edit
      def edit; end

      # POST /books or /books.json
      def create
        @book = ::Admin::Books::Create.call(params)
        render json: BookBlueprint.render(@book), status: :created
      end

      # PATCH/PUT /books/1 or /books/1.json
      def update
        @book = ::Admin::Books::Update.call(params)
        render json: BookBlueprint.render(@book), status: :accepted
      end

      # DELETE /books/1 or /books/1.json
      def destroy
        @book.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:name, :year, :quantity)
      end
    end
  end
end
