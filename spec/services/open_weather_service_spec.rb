require 'rails_helper'

RSpec.describe OpenWeatherService do

  describe 'class methods' do
    describe '::get_forecast_data' do
      it 'can connect to the Open Weather API' do
        VCR.use_cassette("open_weather_forecast") do
          coordinates = { lat: 39, lng: -104 }
          response = OpenWeatherService.get_forecast_data(coordinates)

          expect(response).to be_a(Hash)
          expect(response[:lat]).to eq(coordinates[:lat])
          expect(response[:lon]).to eq(coordinates[:lng])
          expect(response[:lat]).to_not eq(50)
          expect(response[:lon]).to_not eq(50)
          expect(response).to have_key(:current)
          expect(response).to have_key(:daily)
          expect(response[:daily].size).to eq(8)
        end
      end
    end
  end
end
