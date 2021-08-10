class BooksFacade
  def self.get_book_data(location, quantity)
    coordinates = CoordinatesFacade.coordinates(location)
    books = OpenLibraryService.get_books(location, quantity)
    data = OpenWeatherService.get_forecast_data(coordinates)
    forecast = ForecastDetails.new(data)
    temperature = forecast.current_weather[:temperature]
    total_books = books[:numFound]
    book_results = format_books(books)
    details = format_details(location, forecast, temperature, total_books, book_results )
    BookDetails.new(details)
  end

  def self.format_books(books)
    books[:docs].map do |book|
      {
           isbn: book[:lccn],
           title: book[:title],
           publisher: book[:publisher]
         }
    end
  end

  def self.format_details(location, forecast, temperature, total_books, book_results)
    {
      destination: location,
      forecast: {
        summary: forecast.current_weather[:conditions],
        temperature: "#{temperature} F"
      },
      total_books_found: total_books,
      books: book_results
    }
  end
end
