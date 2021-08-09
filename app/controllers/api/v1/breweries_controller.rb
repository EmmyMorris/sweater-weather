class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweryFacade.location(params[:by_dist], params[:quantity])
    # forecast = ForecastFacade.forecast(params[:location])
    render json: BrewerySerializer.new(breweries), status: 200
  end
end
