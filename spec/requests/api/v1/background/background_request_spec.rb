require 'rails_helper'

RSpec.describe "Map Quest API" do

  context 'happy paths' do
    it 'Send current, daily, and hourly weather report' do

      get "/api/v1/backgrounds?location=denver,co"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(body[:data][:attributes]).to have_key(:image)
      expect(body[:data][:attributes][:image]).to be_a(Hash)
      expect(body[:data][:attributes][:image]).to have_key(:location)
      expect(body[:data][:attributes][:image][:location]).to be_a(String)
      expect(body[:data][:attributes][:image]).to have_key(:image_url)

      expect(body[:data][:attributes][:image][:image_url]).to be_a(String)
      expect(body[:data][:attributes][:image]).to have_key(:credit)
      expect(body[:data][:attributes][:image][:credit]).to be_a(Hash)
      expect(body[:data][:attributes][:image][:credit]).to have_key(:source)
      expect(body[:data][:attributes][:image][:credit][:source]).to be_a(String)
      expect(body[:data][:attributes][:image][:credit]).to have_key(:author)
      expect(body[:data][:attributes][:image][:credit][:author]).to be_a(String)
      expect(body[:data][:attributes][:image][:credit]).to have_key(:logo)
      expect(body[:data][:attributes][:image][:credit][:logo]).to be_a(String)
    end
  end
end
