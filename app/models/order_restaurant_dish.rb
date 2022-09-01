class OrderRestaurantDish < ApplicationRecord
  belongs_to :order
  belongs_to :restaurant_dish
end
