class Api::V1::FavoriteBooks::Index::FavoriteBooksSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author, :image
end 