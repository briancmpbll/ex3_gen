FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
    password 'abc123'
    password_confirmation 'abc123'
  end
end
