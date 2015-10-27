json.array!(@character_attributes) do |character_attribute|
  json.extract! character_attribute, :id, :name
  json.url caste_url(character_attribute, format: :json)
end
