class Api::V1::BookController < ApplicationController
  def search
    # require "pry"; binding.pry
    books = BooksFacade.get_book_data(params[:location], params[:quantity])
    render json: BookSerializer.new(books), status: 200
  end
end
