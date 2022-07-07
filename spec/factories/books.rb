# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'MyString' }
    description { 'MyText' }
    author { 'MyString' }
    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/fixtures/pictures/book.jpg'),
        'image/jpg'
      )
    end
  end
end
