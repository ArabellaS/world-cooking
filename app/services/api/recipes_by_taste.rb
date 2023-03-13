require "json"
require "open-uri"

class Api::RecipesByTaste
  def initialize(recipe)
    @recipe = recipe
  end

  def self.call(recipe)
    new(recipe).perform
  end

  def perform
    sleep(1)
    headers = {
      'x-rapidapi-host': "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      'x-rapidapi-key': ENV['SPOONACULAR_API_KEY'] }
    url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{ENV['SPOONACULAR_API_KEY']}&query="
    url_formatted = url + I18n.transliterate(@recipe.name)
    recipe_serialized = URI.open(url_formatted).read
    recipe_result = JSON(recipe_serialized)['results'][0]
    if recipe_result
      id = recipe_result['id']
      taste_url = "https://api.spoonacular.com/recipes/#{id}/tasteWidget.json?apiKey=#{ENV['SPOONACULAR_API_KEY']}"
      recipe_serialized = URI.open(taste_url).read
      recipe = JSON(recipe_serialized)
      flavor_profile = @recipe.update(recipe.each { |key, value| recipe[key] = value / 20 })
    end
  end
end
