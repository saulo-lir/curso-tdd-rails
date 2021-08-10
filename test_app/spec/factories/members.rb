FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { "123456"} 
    password_confirmation { "123456" }
    #confirmed_at { Date.today }
  end
end
