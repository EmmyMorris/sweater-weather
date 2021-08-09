require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    it '::forecast' do
      VCR.use_cassette("weather_facade_forecast") do
        forecast = ForecastFacade.forecast('denver, co')

        expect(forecast.current_weather).to be_a(Hash)
        expect(forecast.daily_weather).to be_a(Array)
      end
    end

    it 'location missing' do
      forecast = ForecastFacade.forecast('denver, co')

      expect(coordinates).to be_an_instance_of(String)
      expect(coordinates).to eq('Location Invalid')
    end
  end
end
