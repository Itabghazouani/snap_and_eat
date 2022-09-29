class AddReviewQuantityToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :review_quantity, :integer
  end
end
