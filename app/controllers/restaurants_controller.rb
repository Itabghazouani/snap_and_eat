class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_name_and_cuisine(params[:query])
    else
      @restaurants = policy_scope(Restaurant)
    end
  end
end
