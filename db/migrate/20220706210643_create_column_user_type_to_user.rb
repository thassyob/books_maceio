# frozen_string_literal: true

class CreateColumnUserTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :integer, default: 0
  end
end
