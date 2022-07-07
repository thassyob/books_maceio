# frozen_string_literal: true

module Api
  module V1
    module Books
      module Create
        class BookSerializer < ActiveModel::Serializer
          attributes :id, :title, :description, :author, :image
        end
      end
    end
  end
end
