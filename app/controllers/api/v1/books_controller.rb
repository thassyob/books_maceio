# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = Book.all

        books = Book.find_by_title(params[:title]) if params[:title].present?
        books = Book.find_by_author(params[:author]) if params[:author].present?

        render json: paginate(books),
               each_serializer: Api::V1::Books::Index::BookSerializer,
               status: :ok
      end

      def create
        authorize :book

        book = Book.create!(create_params)

        render json: book,
               serializer: Api::V1::Books::Create::BookSerializer,
               status: :created
      end

      def update
        book = Book.find(params[:id])

        authorize book

        book.update!(update_params)
        head :no_content
      end

      def destroy
        book = Book.find(params[:id])

        authorize book

        book.destroy
        head :no_content
      end

      private

      def paginate(books)
        books.page(response.set_header('Page-Count', books.page.total_pages))
             .page(response.set_header('items-Count', books.count))
             .page(request.headers['Page'])
             .per(request.headers['Per-Page'])
             .order(created_at: :desc)
      end

      def create_params
        params.require(:book).permit(:title, :description, :author, :image)
      end

      def update_params
        params.require(:book).permit(:title, :description, :author, :image)
      end
    end
  end
end
