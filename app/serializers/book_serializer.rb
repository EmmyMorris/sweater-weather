class BookSerializer
  include JSONAPI::Serializer
  set_id { 'null' }
  set_type :books
  attributes :destination, :forecast, :total_books, :books
end
