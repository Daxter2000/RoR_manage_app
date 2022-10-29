json.extract! product, :id, :name, :description, :unit_price, :unit, :company_id, :model, :created_at, :updated_at
json.url product_url(product, format: :json)
