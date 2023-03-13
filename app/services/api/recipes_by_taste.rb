require "json"
require "open-uri"

class Api::RecipesByTasteService

  def initialize(recipe)
    @recipe = recipe
  end

  def perform

    headers = {
      'x-rapidapi-host': "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      'x-rapidapi-key': ENV['SPOONACULAR_API_KEY'] }
    url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{ENV['SPOONACULAR_API_KEY']}&query="
    url_formatted = url + Recipe.last.name
    recipe_serialized = URI.open(url_formatted).read
    recipe_result = JSON(recipe_serialized)
    id = recipe_result['results'][0]['id']
    taste_url = "https://api.spoonacular.com/recipes/#{id}/tasteWidget.json?apiKey=#{ENV['SPOONACULAR_API_KEY']}"
    recipe_serialized = URI.open(taste_url).read
    recipe = JSON(recipe_serialized)
    flavor_profile = FlavorProfile.new(recipe.map { |_key, value| value = value / 20 })
    @recipe.flavor_profile = flavor_profile
    @recipe.save
  end
end
