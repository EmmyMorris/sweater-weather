require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    it '::forecast' do
      VCR.use_cassette("weather_facade_forecast") do
        forecast = ForecastFacade.forecast('denver, co')

        expect(forecast.current_weather).to be_a(Hash)
        expect(forecast.daily_weather).to be_a(Array)
        expect(forecast.hourly_weather).to be_a(Array)
      end
    end
  end
end
