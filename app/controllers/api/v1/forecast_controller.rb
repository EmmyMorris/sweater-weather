class Api::V1::ForecastController < ApplicationController
  def index
    # require "pry"; binding.pry
    forecast = ForecastFacade.forecast(params[:location])
    render json: ForecastSerializer.new(forecast), status: 200
  end
end
