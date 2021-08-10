require 'rails_helper'

RSpec.describe "Unsplash API" do

  context 'happy paths' do
    it 'Send current, daily, and hourly weather report' do

      get "/api/v1/backgrounds?location=denver"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(body[:data][:attributes][:location]).to be_a(String)
      expect(body[:data][:attributes][:image_url]).to be_a(String)
      expect(body[:data][:attributes]).to have_key(:credit)
      expect(body[:data][:attributes][:credit]).to be_a(Hash)
      expect(body[:data][:attributes][:credit]).to have_key(:source)
      expect(body[:data][:attributes][:credit][:source]).to be_a(String)
      expect(body[:data][:attributes][:credit]).to have_key(:author)
      expect(body[:data][:attributes][:credit][:author]).to be_a(String)
      expect(body[:data][:attributes][:credit]).to have_key(:logo)
      expect(body[:data][:attributes][:credit][:logo]).to be_a(String)
    end
  end
end
