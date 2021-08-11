class RoadTripFacade
  def self.create_trip(origin, destination)
    route = MapQuestService.get_route(origin, destination)
    coordinates = get_coordinates(route[:route][:locations])
    if valid_coordinates?(coordinates)
      data = OpenWeatherService.get_forecast_data(coordinates)
    else
      "Route Impossible"
    end
    forecast = ForecastDetails.new(data)
    temperature = forecast.current_weather[:temperature]
    travel_time = format_time(route[:route][:time])
    details = format_details(origin, destination, route, forecast, temperature, travel_time)
    RoadTripDetails.new(details)
  end
end

# def seconds_to_hours(seconds)
#   Time.at(seconds).utc.strftime("%H:%M:%S")
# end

def get_coordinates(coordinates)
  if coordinates.nil?
    "Route Impossible"
  else
    # coordinates
    coordinates.last[:latLng]
    # "#{coordinates.last[:latLng][:lng]}, #{coordinates.last[:latLng][:lat]}"
  end
end

def valid_coordinates?(coordinates)
  !coordinates.is_a? String
end

def format_time(seconds)
  if seconds.nil?
    "Route Impossible"
  else
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end
end

def format_details(origin, destination, route, forecast, temperature, travel_time)
  {
     start_city: origin,
     end_city: destination,
     travel_time: travel_time,
     weather_at_eta: {
       temperature: "#{temperature} F",
       conditions: forecast.current_weather[:conditions]
     }
  }
end
