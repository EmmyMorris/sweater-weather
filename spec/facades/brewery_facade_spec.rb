require 'rails_helper'

RSpec.describe BreweriesFacade do
  describe 'class methods' do
    it 'returns city details and breweries' do
      brewery = BreweriesFacade.get_brewery_data('denver, co', 5)
      expect(brewery).to be_a BreweriesDetails
      expect(brewery.destination).to be_an(String)
      expect(brewery.forecast).to be_a(Hash)
     	expect(brewery.breweries).to be_a(Array)
     	expect(brewery.breweries.count).to eq(5)
    end
  end
end
