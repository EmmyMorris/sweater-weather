class BackgroundService

  def self.get_background(location)
    new.request_api("/search/photos", location)
  end

  def request_api(path, location)
    resp = conn("https://api.unsplash.com/").get(path) do |faraday|
      faraday.params['client_id'] = ENV['unsplash_key']
      faraday.params['query'] = location
      faraday.params['content_filter'] = "high"
      faraday.params['per_page'] = 1
    end
    parse_json(resp)
    # require "pry"; binding.pry
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end
