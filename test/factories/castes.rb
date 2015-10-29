FactoryGirl.define do
  factory :caste do
    sequence(:name) { |i| "Caste#{i}" }
    association :character_type
  end
end
