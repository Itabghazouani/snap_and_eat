class Restaurant < ApplicationRecord
  has_many :restaurant_dishes, dependent: :destroy
  has_many :dishes, through: :restaurant_dishes
  has_many :orders
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_cuisine_and_dishes,
                  against: %i[cuisine name],
                  associated_against: {
                    dishes: :name
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
