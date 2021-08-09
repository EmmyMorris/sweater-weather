class BrewerySerializer
  include JSONAPI::Serializer
  set_id { 'null' }
  set_type :breweries
  attributes :destination, :forecast, :breweries
end
