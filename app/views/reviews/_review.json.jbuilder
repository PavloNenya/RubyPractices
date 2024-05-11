json.extract! review, :id, :poster_id, :user_id, :rating, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)
