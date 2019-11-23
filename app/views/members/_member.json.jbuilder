json.extract! member, :id, :email, :confirmed, :gift_to, :gift_from, :exchange_id, :created_at, :updated_at
json.url member_url(member, format: :json)
