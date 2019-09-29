json.extract! subscriber, :id, :sub_email, :type_of_sub, :subscribed, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
