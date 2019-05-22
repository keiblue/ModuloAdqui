json.extract! order, :id, :order_date, :estimated_delivery_date, :delivery_date, :created_at, :updated_at
json.url order_url(order, format: :json)
