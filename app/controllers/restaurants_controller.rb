class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_name_and_cuisine(params[:query])
    else
      @restaurants = Restaurant.all
    end
  end
end
