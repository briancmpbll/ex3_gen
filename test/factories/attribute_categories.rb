FactoryGirl.define do
  factory :attribute_category do
    sequence(:name) { |i| "AttributeCategory#{i}" }
  end
end
