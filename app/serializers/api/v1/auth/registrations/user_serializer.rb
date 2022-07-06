class Api::V1::Auth::Registrations::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :user_type
end 