# spec/factories/user.rb

FactoryBot.define do
  factory :user do
    name {'John'}
    email { 'John_Doe@mail.com' }
    password { 'password' }
  end
end
