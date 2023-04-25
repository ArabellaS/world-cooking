# spec/factories/user.rb

FactoryBot.define do
  factory :place do
    lat { 43.604652 }
    lng { 1.444209 }
    city { 'Toulouse' }
    region { 'Occitanie' }
    country { 'France' }
  end
end
