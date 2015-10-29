FactoryGirl.define do
  factory :character_type do
    sequence(:name) { |i| "CharacterType#{i}" }
  end
end
