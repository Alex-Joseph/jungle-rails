json.extract! order_id, :id, :email, :created_at, :updated_at
json.url order_id_url(order_id, format: :json)