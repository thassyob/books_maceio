class AddFavoriteBooksToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favorite_books, :string, array: true, default: []
  end
end
