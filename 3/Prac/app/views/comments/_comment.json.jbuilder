json.extract! comment, :id, :text, :date, :account_id, :poster_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
