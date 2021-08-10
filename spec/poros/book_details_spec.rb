require "rails_helper"

RSpec.describe BookDetails do
  describe 'class methods' do
    describe '::initialize' do
      it 'creates book details object' do
      details = {:destination=> "denver,co",
      :forecast=>{:summary=> "Cloudy", :temperature=> "83 F"},
      :total_books_found=> 172,
      :books=>
      [{:lccn=> ["0762507845"],
          :title=> "Denver, Co",
          :publisher=> ["Universal Map Enterprises"]
        },
        {:lccn=> ["9780883183663"],
          :title=> "Photovoltaic safety, Denver, CO, 1988",
          :publisher=> ["American Institute of Physics"]
        }]}

        book = BookDetails.new(details)

        expect(book).to be_a(BookDetails)
        expect(book.destination).to eq("denver,co")
        expect(book.forecast).to be_a(Hash)
        expect(book.books.count).to eq(2)
      end
    end
  end
end
