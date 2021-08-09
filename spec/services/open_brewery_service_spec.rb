require 'rails_helper'

RSpec.describe OpenBreweryService do

  describe 'class methods' do
    describe '::get_brewery_data' do
      it 'can connect to the Open Brewery API' do
        VCR.use_cassette("open_brewery") do
          location = "denver, co"
          quantity = 5

          response = OpenBreweryService.get_brewery_data(location, quantity)

          expect(response).to be_a(Hash)
          expect(response[:destination]).to eq(location)
          expect(response[:forecast]).to have_key(:summary)
          expect(response[:forecast]).to have_key(:temperature)
          expect(response[:breweries]).to have_key(:id)
          expect(response[:breweries]).to have_key(:name)
          expect(response[:breweries]).to have_key(:brewery_type)
          expect(response[:breweries].size).to eq(quantity)
        end
      end
    end
  end
end
