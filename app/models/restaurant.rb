class Restaurant < ApplicationRecord
  has_many :restaurant_dishes, dependent: :destroy
  has_many :dishes, through: :restaurant_dishes
  has_many :orders
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_cuisine,
                  against: %i[cuisine name],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
