json.extract! loan, :id, :check_out, :returning, :dead_line, :active, :user_id, :book_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
