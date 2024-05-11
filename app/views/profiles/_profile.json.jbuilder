json.extract! profile, :id, :user_id, :name, :surname, :fatherly, :date_of_birth, :telephone, :created_at, :updated_at
json.url profile_url(profile, format: :json)
