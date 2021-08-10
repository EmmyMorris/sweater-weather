class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweriesFacade.get_brewery_data(params[:location], params[:quantity])
    render json: BrewerySerializer.new(breweries), status: 200
  end
end
