class Api::V1::BooksController < ApplicationController
  def create
    book = Book.create!(create_params)

    render json: book,
           serializer: Api::V1::Books::Create::BookSerializer, 
           status: :created
  end

  def update
    book = Book.find(params[:id])

    book.update!(update_params)
    head :no_content
  end

  private

  def create_params
    params.require(:book).permit(:title, :description, :author, :image)
  end

  def update_params
    params.require(:book).permit(:title, :description, :author, :image)
  end
end  