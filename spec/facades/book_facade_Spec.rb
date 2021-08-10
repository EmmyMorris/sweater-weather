require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'class methods' do
    it 'returns book data, destination, and forecast' do
      book = BooksFacade.get_book_data('denver, co', 5)

      expect(book).to be_a BookDetails
      expect(book.destination).to be_an(String)
      expect(book.forecast).to be_a(Hash)
     	expect(book.books).to be_a(Array)
     	expect(book.books.count).to eq(5)
    end
  end
end
