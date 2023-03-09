Quantity.destroy_all# if Rails.env.development?

Quantity.create!(
  amount: 12,
  unit: "slices",
  ingredient: Ingredient.first,
  recipe: Recipe.first
)

Quantity.create!(
  amount: 1,
  unit: "cup",
  ingredient: Ingredient.second,
  recipe: Recipe.first
)

Quantity.create!(
  amount: 0.30,
  unit: "cup",
  ingredient: Ingredient.third,
  recipe: Recipe.first
)

Quantity.create!(
  amount: 0.30,
  unit: "cup",
  ingredient: Ingredient.fourth,
  recipe: Recipe.first
)

Quantity.create!(
  amount: 0.30,
  unit: "cup",
  ingredient: Ingredient.fifth,
  recipe: Recipe.first
)

