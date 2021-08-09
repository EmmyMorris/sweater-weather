require "rails_helper"

RSpec.describe BreweriesDetails do
  describe 'class methods' do
    describe '::initialize' do
      it 'creates city breweries details object' do
        details =  {:destination=>"denver,co",
        :forecast=>{:summary=>"clear sky", :temperature=>302.79},
        :breweries=>
         [{:id=>8245, :name=>"Aero Craft Brewing", :brewery_type=>"planning"},
          {:id=>8962, :name=>"Black Beak Brewing", :brewery_type=>"planning"},
          {:id=>13467, :name=>"Pints Pub Brewery and Freehouse", :brewery_type=>"brewpub"},
          {:id=>11093, :name=>"Grandma's House", :brewery_type=>"micro"},
          {:id=>8598, :name=>"Banded Oak Brewing Company", :brewery_type=>"brewpub"},
          {:id=>15810, :name=>"Woods Boss Brewing Company", :brewery_type=>"micro"},
          {:id=>15077, :name=>"Thirsty Monk Pub Brewery", :brewery_type=>"micro"},
          {:id=>14968, :name=>"The Intrepid Sojourner Beer Project", :brewery_type=>"micro"},
          {:id=>11813, :name=>"Jagged Mountain Brewery", :brewery_type=>"micro"},
          {:id=>11165, :name=>"Great Divide Brewing Co", :brewery_type=>"regional"}]}

        brewery = BreweriesDetails.new(details)

        expect(brewery).to be_a(BreweriesDetails)
        expect(brewery.destination).to eq("denver,co")
        expect(brewery.forecast).to be_a(Hash)
        expect(brewery.breweries.count).to eq(10)
      end
    end
  end
end
