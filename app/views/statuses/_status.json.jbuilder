json.extract! status, :id, :status, :comment, :created_at, :updated_at
json.url status_url(status, format: :json)
