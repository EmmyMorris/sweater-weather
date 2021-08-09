class OpenBreweryService
  def self.get_brewery_data(location, quantity)
    new.request_api("/breweries?location=#{location}&quantity=#{quantity}")
  end

  def request_api(path)
    resp = conn("https://api.openbrewerydb.org").get(path)

    parse_json(resp)
  end


  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
