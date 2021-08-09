class ForecastFacade
  def self.forecast(location)
    coordinates = CoordinatesFacade.coordinates(location)
    data = OpenWeatherService.get_forecast_data(coordinates)
    ForecastDetails.new(data)
  end
end
