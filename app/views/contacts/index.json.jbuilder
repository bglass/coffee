json.array!(@contacts) do |contact|
  json.extract! contact, :id, :person_id, :person_id, :count
  json.url contact_url(contact, format: :json)
end
