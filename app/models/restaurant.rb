class Restaurant < ApplicationRecord
  has_many :restaurant_dishes, dependent: :destroy
  has_many :dishes, through: :restaurant_dishes
  has_many :orders
  has_many :bookings, dependent: :destroy
end
