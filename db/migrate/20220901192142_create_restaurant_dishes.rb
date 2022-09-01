class CreateRestaurantDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_dishes do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.float :price_for_dish

      t.timestamps
    end
  end
end
