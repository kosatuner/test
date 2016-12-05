json.extract! stock, :id, :ticker, :nombre, :descripcion, :market_id, :created_at, :updated_at
json.url stock_url(stock, format: :json)