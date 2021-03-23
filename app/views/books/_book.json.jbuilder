json.extract! book, :id, :title, :edition, :publisher, :isbn, :state, :created_at, :updated_at
json.url book_url(book, format: :json)
