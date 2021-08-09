require 'rails_helper'

RSpec.describe OpenBreweryService do

  describe 'class methods' do
    it 'can connect to the Open Brewery API' do
      coordinates = { lat: 39, lng: 104 }
      quantity = 5
      response = OpenBreweryService.get_breweries(coordinates, quantity)

      expect(response).to be_a(Array)
      expect(response.count).to eq(5)
      # expect(response[:destination]).to eq(location)
      # expect(response[:forecast]).to have_key(:summary)
      # expect(response[:forecast]).to have_key(:temperature)
      # expect(response[:breweries]).to have_key(:id)
      # expect(response[:breweries]).to have_key(:name)
      # expect(response[:breweries]).to have_key(:brewery_type)
    end
  end
end
