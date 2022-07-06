require 'rails_helper'

RSpec.describe "Api::V1::Books", type: :request do
  describe 'POST #create' do
    context 'when creating a book' do
      it 'return 201 status code and attributes' do
        user = create(:user)
        book_params = attributes_for(:book)

        post '/api/v1/books', params: { book: book_params }, headers: get_headers(user)

        expect(response).to have_http_status(:created)
        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:title)
        expect(json_body).to have_key(:description)
        expect(json_body).to have_key(:author)
        expect(json_body).to have_key(:image)
      end
    end
  end
end 