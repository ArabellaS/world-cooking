include ScrapeAllrecipesService::Helpers

Quantity.destroy_all# if Rails.env.development?
Recipe.destroy_all# if Rails.env.development?
Utensil.destroy_all# if Rails.env.development?
Place.destroy_all# if Rails.env.development?

Place.create!(
  city: "Toulouse",
  region: "Occitanie",
  country: "France"
)

Recipe.create!(
  content: "Content, content...",
  place: Place.first
)

Quantity.create!(
  amount: 12,
  unit: "kg",
  ingredient: Ingredient.first,
  recipe: Recipe.first
)

# ScrapeAllrecipesService.new("cheese").call

