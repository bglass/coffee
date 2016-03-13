json.array!(@likes) do |like|
  json.extract! like, :id, :person_id, :product_id, :count
  json.url like_url(like, format: :json)
end
