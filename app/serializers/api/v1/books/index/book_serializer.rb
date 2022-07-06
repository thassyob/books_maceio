class Api::V1::Books::Index::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author, :image
end 