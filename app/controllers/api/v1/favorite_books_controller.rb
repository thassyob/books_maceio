# frozen_string_literal: true

module Api
  module V1
    class FavoriteBooksController < ApplicationController
      def index
        authorize :favorite_books

        favorite_books = Book.where(id: current_api_v1_user.favorite_books)

        render json: favorite_books,
               each_serializer: Api::V1::FavoriteBooks::Index::FavoriteBooksSerializer,
               status: :ok
      end

      def create
        authorize :favorite_books

        book = Book.find(favorite_params[:book_id])

        current_api_v1_user.favorite_books << book.id
        current_api_v1_user.save

        render json: current_api_v1_user.favorite_books,
               status: :created
      end

      def destroy
        authorize :favorite_books

        book = Book.find(params[:id])

        current_api_v1_user.favorite_books.delete(book.id.to_s)
        current_api_v1_user.save

        head :no_content
      end

      private

      def favorite_params
        params.require(:favorite_data).permit(:book_id)
      end
    end
  end
end
