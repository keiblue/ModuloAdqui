json.extract! item, :id, :nombre, :precio, :created_at, :updated_at
json.url item_url(item, format: :json)
