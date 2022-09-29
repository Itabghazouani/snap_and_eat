class AddReviewQuantityToRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :review_quantity
    add_column :restaurants, :review_quantity, :integer
  end
end
