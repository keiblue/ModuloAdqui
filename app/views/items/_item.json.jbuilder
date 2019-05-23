json.extract! item, :id, :nombre, :precio, :count, :created_at, :updated_at
json.url item_url(item, format: :json)
