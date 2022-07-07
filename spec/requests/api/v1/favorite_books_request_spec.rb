# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::FavoriteBooks', type: :request do
  describe 'GET #index' do
    it 'must return 200 http status code and list attributes' do
      book = create(:book)
      user = create(:user, favorite_books: [book.id])

      get '/api/v1/favorite_books', headers: get_headers(user)

      expect(response).to have_http_status(:ok)

      expect(json_body[0]).to have_key(:id)
      expect(json_body[0]).to have_key(:title)
      expect(json_body[0]).to have_key(:description)
      expect(json_body[0]).to have_key(:author)
      expect(json_body[0]).to have_key(:image)
    end
  end

  describe 'POST #create' do
    it 'must return 201 http status' do
      user = create(:user)
      book = create(:book)

      post '/api/v1/favorite_books', params: { favorite_data: { book_id: book.id } }, headers: get_headers(user)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE #destroy' do
    it 'must return 204 http status code' do
      user = create(:user)
      book = create(:book)

      delete "/api/v1/favorite_books/#{book.id}", headers: get_headers(user)

      expect(response).to have_http_status(:no_content)
    end

    it 'need to remove the favorite books' do
      book = create(:book)
      user = create(:user, favorite_books: [book.id])

      delete "/api/v1/favorite_books/#{book.id}", headers: get_headers(user)

      expect(User.find(user.id).favorite_books.count).to eq(0)
    end
  end
end
