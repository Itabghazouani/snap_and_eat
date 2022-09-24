class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :booking_date, presence: true
  validates :guest_count, presence: true
  validate :booking_date_in_the_past

  private

  def booking_date_in_the_past
    return if booking_date.blank?

    errors.add(:booking_date, "issue. Your booking is not possible, please choose a time in the future") if booking_date < Time.now
  end
end
