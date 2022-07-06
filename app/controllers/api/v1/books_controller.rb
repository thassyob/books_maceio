class Api::V1::BooksController < ApplicationController
  def create
    book = Book.create!(book_params)

    render json: book,
           serializer: Api::V1::Books::Create::BookSerializer, 
           status: :created
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :image)
  end
end  