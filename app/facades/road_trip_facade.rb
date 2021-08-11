class RoadTripFacade
  def self.create_trip(origin, destination)
    route = MapQuestService.get_route(origin, destination)
    coordinates = route[:route][:locations].last[:latLng]
    data = OpenWeatherService.get_forecast_data(coordinates)
    forecast = ForecastDetails.new(data)
    temperature = forecast.current_weather[:temperature]
    details = format_details(origin, destination, route, forecast, temperature)
    RoadTripDetails.new(details)
  end
end

def format_details(origin, destination, route, forecast, temperature)
  {
     start_city: origin,
     end_city: destination,
     travel_time: route[:route][:time],
     weather_at_eta: {
       temperature: "#{temperature} F",
       conditions: forecast.current_weather[:conditions]
     }
  }
end
