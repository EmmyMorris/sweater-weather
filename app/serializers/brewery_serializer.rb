class BrewerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :breweries
end
