require 'rails_helper'

describe BackgroundFacade do
  describe 'class methods' do
    describe '::background' do
      it 'gets background' do
        VCR.use_cassette("background_facade") do
          background = BackgroundFacade.get_image('denver')
          expect(background).to be_a(BackgroundDetails)
          expect(background.location).to be_an_instance_of(String)
          expect(background.image_url).to be_an_instance_of(String)
          expect(background.credit).to have_key(:source)
          expect(background.credit).to have_key(:author)
          expect(background.credit).to have_key(:logo)
        end
      end
    end
  end
end
