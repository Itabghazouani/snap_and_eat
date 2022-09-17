class BookingsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_booking, only: %i[edit update]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.restaurant = @restaurant
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @booking.update(booking_params)
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :guest_count)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
