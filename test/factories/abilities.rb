FactoryGirl.define do
  factory :ability do
    sequence(:name) { |i| "Ability#{i}" }
  end
end
