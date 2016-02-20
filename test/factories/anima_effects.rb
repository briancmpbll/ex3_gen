FactoryGirl.define do
  factory :anima_effect do
    condition 'Spend 10 motes'
    effect 'Kill everyone'

    factory :type_anima_effect do
      association :character_type
    end

    factory :caste_anima_effect do
      association :caste
    end
  end
end
