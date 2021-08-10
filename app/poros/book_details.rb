class BookDetails
  attr_reader :destination,
              :forecast,
              :total_books,
              :books

  def initialize(attributes)
    @destination = attributes[:destination]
    @forecast = attributes[:forecast]
    @total_books = attributes[:total_books]
    @books = attributes[:books]
  end
end
