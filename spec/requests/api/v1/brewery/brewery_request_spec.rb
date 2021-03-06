require 'rails_helper'

RSpec.describe "Open Brewery API" do

  context 'happy paths' do
    it 'Sends destination, forecast, and breweries in that city', :vcr do

      get "/api/v1/breweries?location=denver,co&quantity=5"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(body[:data][:attributes]).to have_key(:destination)
      expect(body[:data][:attributes][:destination]).to be_a(String)
      expect(body[:data][:attributes]).to have_key(:forecast)
      expect(body[:data][:attributes][:forecast]).to be_a(Hash)

      expect(body[:data][:attributes]).to have_key(:breweries)
      expect(body[:data][:attributes][:breweries]).to be_a(Array)
    end
  end
end
