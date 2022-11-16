# frozen_string_literal: true

module Apo
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i[show edit update destroy]
      # GET /authors or /authors.json
      def index
        @authors = Author.includes(books: %i[genres subscriptions])
        render json: AuthorBlueprint.render(@authors)
      end

      # GET /authors/1 or /authors/1.json
      def show; end

      # GET /authors/new
      def new
        @author = Author.new
      end

      # GET /authors/1/edit
      def edit; end

      # POST /authors or /authors.json
      def create
        @author = Author.new(author_params)
        if @author.save
          render json: @author, status: :created
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /authors/1 or /authors/1.json
      def update
        respond_to do |format|
          if @author.update(author_params)
            format.html { redirect_to author_url(@author), notice: 'Author was successfully updated.' }
            format.json { render :show, status: :ok, location: @author }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @author.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /authors/1 or /authors/1.json
      def destroy
        @author.destroy

        respond_to do |format|
          format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:name)
      end
    end
  end
end
