class BreweryFacade
  def self.location(coordinates, quantity)
    brewery_data = OpenBreweryService.get_brewery_data(coordinates, quantity)
    number = ((quantity.to_i) - 1)
    brewery_data[0..(number)].map do |attributes|
      forecast = OpenWeatherService.get_forecast_data(coordinates)
      BreweryDetails.new(attributes, forecast)
    end
  end
end
