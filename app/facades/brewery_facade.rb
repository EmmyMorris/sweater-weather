class BreweryFacade
  def self.location(location)
    coordinates = CoordinatesFacade.coordinates(location)
    weather_data = OpenWeatherService.get_forecast_data(coordinates)
    brewery_data = OpenBreweryService.get_brewery_data(coordinates, quantity)
    limit = (quantity - 1)
    brewery_data[0..(limit)].map do |attributes|
      BreweryDetails.new(attributes)
    end
  end
end
