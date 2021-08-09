class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweryFacade.location(params[:location])
    # forecast = ForecastFacade.forecast(params[:location])
    # render json: ForecastSerializer.new(forecast), status: 200
  end
end
