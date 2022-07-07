# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :author, presence: true

  has_one_attached :image

  scope :find_by_title, ->(title) { where(title: title) }
  scope :find_by_author, ->(author) { where(author: author) }
end
