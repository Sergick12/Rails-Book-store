# frozen_string_literal: true

json.extract! subscription, :id, :books_id, :subscribers_id, :delete_at, :is_active, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
