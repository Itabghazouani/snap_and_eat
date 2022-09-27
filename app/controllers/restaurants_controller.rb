class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = Restaurant.geocoded.where(id: @restaurant.id).map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
    authorize @restaurant
  end

  def index
    if params[:query].present?
      @restaurants = policy_scope(Restaurant.search_by_name_cuisine_and_dishes(params[:query]))
    else
      @restaurants = policy_scope(Restaurant)
    end


  end
end
