require 'rails_helper'

RSpec.describe BreweryFacade do
  describe 'class methods' do
    it '::brewery' do
      VCR.use_cassette("open_brewery") do
        brewery = BreweryFacade.location('denver, co', "5")

        expect(brewery).to be_a Brewery

        expect(brewery.destination).to be_an(String)
        expect(brewery.forecast).to be_a(Hash)
       	expect(brewery.breweries).to be_a(String)
       	expect(brewery.breweries.count).to eq(5)

       	expect(brewery.breweries.first[:id]).to be_a(Integer)
       	expect(brewery.breweries.first[:name]).to be_a(String)
       	expect(brewery.breweries.first[:brewery_type]).to be_a(String)
      end
    end
  end
end
