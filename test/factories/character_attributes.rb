FactoryGirl.define do
  factory :character_attribute do
    sequence(:name) { |i| "Attribute#{i}" }
    association :attribute_category
  end
end
