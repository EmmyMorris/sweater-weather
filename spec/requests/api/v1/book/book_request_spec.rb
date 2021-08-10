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
      expect(body[:data][:attributes][:forecast]).to have_key(:summary)
      expect(body[:data][:attributes][:forecast]).to have_key(:temperature)

      expect(body[:data][:attributes]).to have_key(:total_books_found)
      expect(body[:data][:attributes][:total_books_found]).to be_a(Integer)

      expect(body[:data][:attributes]).to have_key(:books)
      expect(body[:data][:attributes][:books]).to be_a(Array)
      expect(body[:data][:attributes][:books][0]).to have_key(:isbn)
      expect(body[:data][:attributes][:books][0][:isbn]).to be_a(Array)
      expect(body[:data][:attributes][:books][0]).to have_key(:title)
      expect(body[:data][:attributes][:books][0][:title]).to be_a(String)
      expect(body[:data][:attributes][:books][0]).to have_key(:publisher)
      expect(body[:data][:attributes][:books][0][:publisher]).to be_a(Array)
    end
  end
end
