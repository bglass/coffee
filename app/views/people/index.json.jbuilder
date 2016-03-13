json.array!(@people) do |person|
  json.extract! person, :id, :name, :feature
  json.url person_url(person, format: :json)
end