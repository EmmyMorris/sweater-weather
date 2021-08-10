require "rails_helper"

RSpec.describe BookDetails do
  describe 'class methods' do
    describe '::initialize' do
      it 'creates book details object' do
      details = {:destination=> "denver,co",
      :forecast=>{:summary=> "Cloudy", :temperature=> "83 F"},
      :total_books_found=> 172,
      :books=>
      [{:isbn=> ["0762507845"],
          :title=> "Denver, Co",
          :publisher=> ["Universal Map Enterprises"]
        },
        {:isbn=> ["9780883183663"],
          :title=> "Photovoltaic safety, Denver, CO, 1988",
          :publisher=> ["American Institute of Physics"]
        }]}

        book = BookDetails.new(details)

        expect(book).to be_a(BookDetails)
        expect(book.destination).to eq("denver,co")
        expect(book.forecast).to be_a(Hash)
        expect(book.forecast[:summary]).to eq("Cloudy")
        expect(book.forecast[:temperature]).to eq("83 F")
        expect(book.total_books_found).to eq(172)
        expect(book.books).to be_a(Array)
        expect(book.books.count).to eq(2)
        expect(book.books.first[:isbn]).to eq(["0762507845"])
        expect(book.books.first[:title]).to eq("Denver, Co")
        expect(book.books.first[:publisher]).to eq(["Universal Map Enterprises"])
      end
    end
  end
end
