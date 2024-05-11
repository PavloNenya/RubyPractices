json.extract! payment, :id, :poster_id, :user_id, :date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
