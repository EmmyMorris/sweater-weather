class Api::V1::BookController < ApplicationController
  def search
    books = BooksFacade.get_book_data(params[:location], params[:quantity])
    render json: BookSerializer.new(book), status: 200
  end
end
