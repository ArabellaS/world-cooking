# spec/factories/user.rb

FactoryBot.define do
  factory :flavor_profile do
    user { User.first || build(:user) }
    sourness { 0.2 }
    spiciness { 0.2 }
    saltiness { 0.2 }
    savoriness { 0.2 }
    sweetness { 0.2 }
    bitterness { 0.2 }
    fattiness { 0.2 }
  end
end
