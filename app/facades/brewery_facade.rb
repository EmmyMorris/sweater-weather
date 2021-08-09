class BreweryFacade
  def self.location(location)
    coordinates = CoordinatesFacade.coordinates(location)
    weather_data = OpenWeatherService.get_forecast_data(coordinates)
    brewery_data = OpenBreweryService.get_brewery_data(coordinates)
    brewery_data[0..5].map do |attributes|
      BreweryDetails.new(attributes)
    end
  end
end
