class BreweryFacade
  def self.breweries_by_location(location)
    coordinates = CoordinatesFacade.coordinates(location)
    data = OpenBreweryService.get_brewery_data(coordinates)
    BreweryDetails.new(data)
  end
end
