FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
    password 'abc123'
    password_confirmation 'abc123'

    factory :default_user do
      email 'user@email.com'
    end

    factory :blank_user do
      email ''
      password ''
      password_confirmation ''
    end

    factory :user_blank_email do
      email ''
    end

    factory :user_blank_password do
      password ''
    end

    factory :user_blank_confirmation do
      password_confirmation ''
    end
  end
end
