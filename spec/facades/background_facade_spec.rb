require 'rails_helper'

describe BackgroundFacade do
  describe 'class methods' do
    describe '::background' do
      it 'gets background' do
        VCR.use_cassette("background_facade") do
          background = BackgroundFacade.get_background('denver,co')

          expect(background).to be_a(BackgroundDetails)
          expect(background.info).to have_key(:location)
          expect(background.info).to have_key(:image_url)
          expect(background.info).to have_key(:credit)
          expect(background.info[:credit]).to have_key(:source)
          expect(background.info[:credit]).to have_key(:author)
        end
      end

      it 'location missing' do
        background = BackgroundFacade.get_background('')

        expect(background).to be_an_instance_of(String)
        expect(background).to eq('Location Invalid')
      end
    end
  end
end
