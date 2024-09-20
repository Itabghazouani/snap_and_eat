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

  private

  def geocode
    result = Geocoder.search(address)
    if result.first
      Rails.logger.debug "Geocoding successful for #{address}: #{result.first.coordinates}"
    else
      Rails.logger.error "Geocoding failed for #{address}"
    end
    super
  rescue => e
    Rails.logger.error "Geocoding error for #{address}: #{e.message}"
  end
end
