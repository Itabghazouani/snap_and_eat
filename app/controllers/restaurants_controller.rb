class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
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
