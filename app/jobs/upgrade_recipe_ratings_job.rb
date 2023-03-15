class UpgradeRecipeRatingsJob < ApplicationJob
  queue_as :default

  def perform(recipe)
    unless recipe.fattiness
      p "recipe #{recipe.name} update"
      Api::RecipesByTaste.call(recipe)
      p "recipe #{recipe.name} updated"
    end
  end
end
