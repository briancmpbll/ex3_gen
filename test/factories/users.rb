FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "user#{i}" }
    sequence(:email) { |i| "email#{i}@email.com" }
    password 'abc123'
    password_confirmation 'abc123'

    factory :admin_user do
      admin true
    end
  end
end
