FactoryBot.define do
  factory :quantity do
    amount { "1.5" }
    unit { 'kg' }
    ingredient { Ingredient.first || build(:ingredient) }
    recipe { Recipe.first || build(:recipe) }
  end
end
