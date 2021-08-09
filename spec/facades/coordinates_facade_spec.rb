require 'rails_helper'

RSpec.describe CoordinatesFacade do
  describe 'class methods' do
    describe '::coordinates' do
      it 'returns latitude and longitude' do
        VCR.use_cassette("coordinates") do
          coordinates = CoordinatesFacade.coordinates('denver, co')

          expect(coordinates).to be_a(Hash)
          expect(coordinates).to have_key(:lat)
          expect(coordinates).to have_key(:lng)
          expect(coordinates).to_not have_key(:locations)
        end
      end

      it 'coordinates missing' do
        coordinates = CoordinatesFacade.coordinates('')

        expect(coordinates).to be_an_instance_of(String)
        expect(coordinates).to eq('Coordinates Invalid')
      end
    end
  end
end
