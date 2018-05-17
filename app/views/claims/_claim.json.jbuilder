json.extract! claim, :id, :user_id, :terms_and_conditions, :created_at, :updated_at
json.url claim_url(claim, format: :json)
