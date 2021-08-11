require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'class methods' do
    it '::roadtrip' do
      VCR.use_cassette("road_trip") do
        road_trip = RoadTripFacade.create_trip("Denver, CO", "Estes Park, CO")

        expect(road_trip).to be_a(RoadTripDetails)
        expect(road_trip.start_city).to be_a(String)
        expect(road_trip.end_city).to be_a(String)
        expect(road_trip.travel_time).to be_a(String)
        expect(road_trip.weather_at_eta[:temperature]).to be_a(String)
        expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
      end
    end
  end
end
