require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'class methods' do
    it 'returns book data, destination, and forecast' do
      book = BooksFacade.get_book_data('denver, co', 5)

      expect(book).to be_a BookDetails
      expect(book.destination).to be_an(String)

      expect(book.forecast).to be_a(Hash)
      expect(book.forecast).to have_key(:summary)
      expect(book.forecast).to have_key(:temperature)
      expect(book.forecast[:summary]).to be_a(String)
      expect(book.forecast[:temperature]).to be_a(String)

      expect(book.total_books_found).to be_a(Integer)

     	expect(book.books).to be_a(Array)
      expect(book.books.count).to eq(5)
     	expect(book.books[0]).to have_key(:isbn)
     	expect(book.books[0][:isbn]).to be_a(Array)
     	expect(book.books[0]).to have_key(:title)
      expect(book.books[0][:title]).to be_a(String)
     	expect(book.books[0]).to have_key(:publisher)
      expect(book.books[0][:publisher]).to be_a(Array)
    end
  end
end
