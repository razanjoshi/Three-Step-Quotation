json.extract! subscription, :id, :name, :daily_rate, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
