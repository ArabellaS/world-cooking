require 'wit'

class WitBot::RecipesBot
  def initialize(country)
    @access_token = access_token
    @country = country
    @all_recipes = {
      'France' => Recipe.where(country: @country).to_a,
      'Italy' => Recipe.where(country: @country).to_a,
      'Japan' => Recipe.where(country: @country).to_a,
    }
  end
  
end