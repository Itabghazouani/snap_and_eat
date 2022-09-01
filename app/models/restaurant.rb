class Restaurant < ApplicationRecord
  has_many :restaurant_dishes
  has_many :orders
end
