json.array!(@castes) do |caste|
  json.extract! caste, :id, :name
  json.url caste_url(caste, format: :json)
end
