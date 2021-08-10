require 'rails_helper'

RSpec.describe "Open Library API" do

  context 'happy paths' do
    it 'Sends destination, forecast, total number of searches, and a quantity of books about the destination city', :vcr do

      get "/api/v1/book-search?location=denver,co&quantity=5"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(body[:data][:attributes]).to have_key(:destination)
      expect(body[:data][:attributes][:destination]).to be_a(String)
      expect(body[:data][:attributes]).to have_key(:forecast)
      expect(body[:data][:attributes][:forecast]).to be_a(Hash)

      expect(body[:data][:attributes]).to have_key(:books)
      expect(body[:data][:attributes][:books]).to be_a(Array)
    end
  end
end
