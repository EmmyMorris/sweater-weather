require "rails_helper"

RSpec.describe RoadTripDetails do
  describe 'class methods' do
    describe '::initialize' do
      it 'creates roadtrip details object' do
      details = {
      :start_city=> "Denver, CO",
      :end_city=> "Estes Park, CO",
      :travel_time=> "2 hours, 13 minutes",
      :weather_at_eta=> {
        :temperature=> 59.4,
        :conditions=> "partly cloudy with a chance of meatballs"
      }}

        road_trip = RoadTripDetails.new(details)
        # expect(book).to be_a(BookDetails)
        # expect(book.destination).to eq("denver,co")
        # expect(book.forecast).to be_a(Hash)
        # expect(book.forecast[:summary]).to eq("Cloudy")
        # expect(book.forecast[:temperature]).to eq("83 F")
        # expect(book.total_books_found).to eq(172)
        # expect(book.books).to be_a(Array)
        # expect(book.books.count).to eq(2)
        # expect(book.books.first[:isbn]).to eq(["0762507845"])
        # expect(book.books.first[:title]).to eq("Denver, Co")
        # expect(book.books.first[:publisher]).to eq(["Universal Map Enterprises"])
      end
    end
  end
end
