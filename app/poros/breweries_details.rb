class BreweriesDetails
  attr_reader :destination,
              :forecast,
              :breweries

  def initialize(attributes)
    @destination = attributes[:destination]
    @forecast = attributes[:forecast]
    @breweries = attributes[:breweries]
  end
end
