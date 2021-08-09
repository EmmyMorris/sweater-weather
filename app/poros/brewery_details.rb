class BreweryDetails
  attr_reader :destination,
              :forecast,
              :breweries

  def initialize(attributes)
    # require "pry"; binding.pry
    # @destination = attributes[:location]
    # @forecast = get_current_weather(attributes[:current])
    @breweries = get_brewery_data(attributes[:coordinates], attributes[:quantity])
  end

private
  # def get_current_weather(data)
  #   {
  #     datetime: Time.at(data[:dt]).to_s(:dt),
  #     sunrise: Time.at(data[:sunrise]).to_s(:time),
  #     sunset: Time.at(data[:sunset]).to_s(:time),
  #     temperature: data[:temp],
  #     feels_like: data[:feels_like],
  #     humidity: data[:humidity],
  #     uvi: data[:uvi],
  #     visibility: data[:visibility],
  #     conditions: data[:weather][0][:description],
  #     icon: data[:weather][0][:icon]
  #   }
  # end

  def get_brewery_data(data, quantity)
    {
      id: data[:id],
      name: data[:name],
      brewery_type: data[:brewery_type]
    }
  end
end
