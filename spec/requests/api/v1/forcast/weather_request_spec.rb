require 'rails_helper'

RSpec.describe "Map Quest API" do

  context 'happy paths' do
    it 'Send current, daily, and hourly weather report', :vcr do

      get "/api/v1/forecast?location=denver,co"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(body[:data][:attributes]).to have_key(:weather_forecast)
      expect(body[:data][:attributes][:weather_forecast]).to have_key(:current_weather)
      expect(body[:data][:attributes][:weather_forecast][:current_weather]).to be_a(Hash)
      expect(body[:data][:attributes][:weather_forecast]).to have_key(:daily_weather)
      expect(body[:data][:attributes][:weather_forecast][:daily_weather]).to be_a(Array)
      expect(body[:data][:attributes][:weather_forecast]).to have_key(:hourly_weather)
      expect(body[:data][:attributes][:weather_forecast][:hourly_weather]).to be_a(Array)
    end
  end
end
