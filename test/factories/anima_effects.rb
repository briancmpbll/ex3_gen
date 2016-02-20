FactoryGirl.define do
  factory :anima_effect do
    condition 'Spend 10 motes'
    effect 'Kill everyone'
    association :character_type
    association :caste
  end
end
