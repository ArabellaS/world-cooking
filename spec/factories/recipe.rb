# spec/factories/user.rb

FactoryBot.define do
  factory :recipe do
    content { 'Very Spicy 😀' }
    name { "Poulet Curry" }
    sourness { 0.2 }
    spiciness { 0.2 }
    saltiness { 0.2 }
    savoriness { 0.2 }
    sweetness { 0.2 }
    bitterness { 0.2 }
    fattiness { 0.2 }
    place { Place.first || build(:place) }
  end
end
