class AddAuthorPricePublisheddateToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author, :string
    add_column :books, :price, :numeric
    add_column :books, :published, :date
  end
end
