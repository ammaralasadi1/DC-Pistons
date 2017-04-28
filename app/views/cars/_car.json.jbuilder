json.extract! car, :id, :title, :body, :make, :model, :year, :price, :seller_name, :seller_phone, :photo_url, :created_at, :updated_at
json.url car_url(car, format: :json)
