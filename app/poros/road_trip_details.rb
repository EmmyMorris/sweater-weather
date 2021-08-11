class RoadTripDetails
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(attributes)
    # require "pry"; binding.pry
    @start_city = attributes[:start_city]
    @end_city = attributes[:end_city]
    @travel_time = attributes[:travel_time]
    @weather_at_eta = attributes[:weather_at_eta]
  end
end
