class Api::V1::Auth::Sessions::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end 