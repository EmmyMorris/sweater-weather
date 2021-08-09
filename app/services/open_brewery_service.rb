class OpenBreweryService
  def self.get_breweries(coordinates, quantity)
    new.request_api("/breweries?by_dist=#{coordinates[:lat]},#{coordinates[:lng]}&per_page=#{quantity}")
  end

  def request_api(path)
    response = conn("https://api.openbrewerydb.org").get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
