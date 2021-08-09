class BreweryFacade
  def breweries_by_location(location)
    # coordinates = CoordinatesFacade.coordinates(location)
    coordinates = CoordinatesFacade.coordinates(location)
    weather_data = OpenWeatherService.get_forecast_data(coordinates)
    brewery_data = OpenBreweryService.get_brewery_data(location, quantity)

    data.limit(quantity).map do |attributes|
      BreweryDetails.new(attributes)
    end
  end
end
