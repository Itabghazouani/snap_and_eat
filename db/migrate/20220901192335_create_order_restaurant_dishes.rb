class CreateOrderRestaurantDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :order_restaurant_dishes do |t|
      t.references :order, null: false, foreign_key: true
      t.references :restaurant_dish, null: false, foreign_key: true
      t.integer :quantity
      t.float :price_for_dish

      t.timestamps
    end
  end
end
