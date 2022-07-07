# frozen_string_literal: true

module Api
  module V1
    module Auth
      module Registrations
        class UserSerializer < ActiveModel::Serializer
          attributes :id, :name, :email, :user_type
        end
      end
    end
  end
end
