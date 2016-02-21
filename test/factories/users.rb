FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
    encrypted_password 'abc123'
    salt '1234'
  end
end
