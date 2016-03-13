json.array!(@choices) do |choice|
  json.extract! choice, :id, :order_id, :person_id, :product_id
  json.url choice_url(choice, format: :json)
end
