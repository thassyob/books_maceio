class Api::V1::Books::Create::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author, :image
end 