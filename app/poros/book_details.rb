class BookDetails
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(attributes)
    @destination = attributes[:destination]
    @forecast = attributes[:forecast]
    @total_books_found = attributes[:total_books_found]
    @books = attributes[:books]
  end
end
