require 'rails_helper'

RSpec.describe "Api::V1::Books", type: :request do
  describe 'INDEX #books' do
    context 'when list books' do
      it 'must return 200 http status code and list attributes' do
        user = create(:user)
        book1 = create(:book, created_at: 1.days.ago)
        book2 = create(:book, created_at: DateTime.current)

        get '/api/v1/books', headers: get_headers(user)

        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:title)
        expect(json_body[0]).to have_key(:description)
        expect(json_body[0]).to have_key(:author)
        expect(json_body[0]).to have_key(:image)

        expect(json_body[0][:id]).to eq(book2.id)
        expect(json_body[1][:id]).to eq(book1.id)
      end
    end

    context 'when filtered list books' do
      it 'by title' do
        user = create(:user)
        book1 = create(:book, title: 'teste1')
        book2 = create(:book, title: 'teste2')
        query_params = 'teste1'

        get "/api/v1/books?title=#{query_params}", headers: get_headers(user)
        
        expect(json_body.count).to eq(1)
      end

      it 'by author' do
        user = create(:user)
        book1 = create(:book, author: 'teste1')
        book2 = create(:book, author: 'teste2')
        query_params = 'teste1'

        get "/api/v1/books?author=#{query_params}", headers: get_headers(user)
        
        expect(json_body.count).to eq(1)
      end
    end
  end
  
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

  describe 'PUT #update' do
    context 'when pass valid data' do
      it 'return 204 status code' do
        user = create(:user)
        book = create(:book)
        book_params = { title: 'Teste', author: 'teste' }

        put "/api/v1/books/#{book.id}", params: { book: book_params }, headers: get_headers(user)

        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when book is deleted" do
      it "return http status 204" do
        user = create(:user)
        book = create(:book)
       
        delete "/api/v1/books/#{book.id}", headers: get_headers(user)

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end 