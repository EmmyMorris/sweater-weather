class MapQuestService

  def self.get_coordinates(location)
    new.request_api("/geocoding/v1/address?location=#{location}")
  end

  def self.get_route(origin, destination)
    resp = Faraday.get("http://www.mapquestapi.com/directions/v2/route") do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
      faraday.params['from'] = origin
      faraday.params['to'] = destination
    end
    t = JSON.parse(resp.body, symbolize_names: true)
  end

  def request_api(path)
    response = conn("http://www.mapquestapi.com").get(path) do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
    end

    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
