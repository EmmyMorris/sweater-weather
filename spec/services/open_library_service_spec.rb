require 'rails_helper'

RSpec.describe OpenLibraryService do

  describe 'class methods' do
    it 'can connect to the Open Library API' do
      location = "denver, co"
      quantity = 5
      response = OpenLibraryService.get_books(location, quantity)
      
      expect(response[:docs]).to be_a(Array)
      expect(response[:docs].count).to eq(5)
      expect(response[:docs][0][:lccn]).to eq(["85601140"])
      expect(response[:docs][0][:title]).to eq("Relocation of Western Executive Seminar Center from Denver to Grand Junction, CO")
      expect(response[:docs][0][:publisher]).to eq(["U.S. G.P.O."])
    end
  end
end
