class BreweriesFacade
  def self.get_brewery_data(location, quantity)
    coordinates = CoordinatesFacade.coordinates(location)
    breweries = OpenBreweryService.get_breweries(coordinates, quantity)
    data = OpenWeatherService.get_forecast_data(coordinates)
    forecast = ForecastDetails.new(data)
    temperature = farenheit(forecast.current_weather[:temperature])
    city_breweries = format_breweries(breweries)
    details = format_details(location, forecast, temperature, city_breweries)
    BreweriesDetails.new(details)
  end

  def self.farenheit(kelvin)
    ((kelvin - 273.15)* 9/5 +32).round
  end

  def self.format_breweries(breweries)
    breweries.map do |brewery|
      {
           id: brewery[:id],
           name: brewery[:name],
           brewery_type: brewery[:brewery_type]
         }
    end
  end

  def self.format_details(location, forecast, temperature, city_breweries)
    {
      destination: location,
      forecast: {
        summary: forecast.current_weather[:conditions],
        temperature: "#{temperature} F"
      },
      breweries: city_breweries
    }
  end
end
