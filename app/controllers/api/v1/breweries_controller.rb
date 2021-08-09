class Api::V1::BreweriesController < ApplicationController
  def index
    # require "pry"; binding.pry
    breweries = BreweryFacade.breweries_by_location(params[:location])
    # forecast = ForecastFacade.forecast(params[:location])
    # render json: ForecastSerializer.new(forecast), status: 200
  end
end
