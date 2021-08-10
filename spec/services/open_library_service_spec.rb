require 'rails_helper'

RSpec.describe OpenLibraryService do

  describe 'class methods' do
    it 'can connect to the Open Library API' do
      location = "denver, co"
      quantity = 5
      response = OpenLibraryService.get_books(location, quantity)
      # require "pry"; binding.pry
      expect(response[:docs]).to be_a(Array)
      expect(response[:docs].count).to eq(5)
      # expect(response[:destination]).to eq(location)
      # expect(response[:forecast]).to have_key(:summary)
      # expect(response[:forecast]).to have_key(:temperature)
      # expect(response[:breweries]).to have_key(:id)
      # expect(response[:breweries]).to have_key(:name)
      # expect(response[:breweries]).to have_key(:brewery_type)
    end
  end
end
