json.array!(@anima_effects) do |anima_effect|
  json.extract! anima_effect, :id, :condition, :effect
  json.url anima_effect_url(anima_effect, format: :json)
end
