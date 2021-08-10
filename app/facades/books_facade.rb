class BooksFacade
  def self.get_book_data(location, quantity)
    coordinates = CoordinatesFacade.coordinates(location)
    books = OpenLibraryService.get_books(location, quantity)
    data = OpenWeatherService.get_forecast_data(coordinates)
    forecast = ForecastDetails.new(data)
    temperature = farenheit(forecast.current_weather[:temperature])
    total_books = book_count(books)
    book_results = format_books(books)
    details = format_details(location, forecast, temperature, city_breweries)
    BreweriesDetails.new(details)
  end

  def self.book_count(books)
    books[:total_books_found]
  end

  def self.farenheit(kelvin)
    ((kelvin - 273.15)* 9/5 +32).round
  end

  def self.format_books(books)
    books.map do |book|
      {
           id: book[:lccn],
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
